//
//  RealtimeDBService.swift
//  iOS
//
//  Created by JimmyShih on 2020/10/28.
//

import Foundation
import FirebaseDatabase

enum StoreKey: String {
    case dpo = "dpo"
    case storeName = "storeName"
    case storeAddress = "storeAddress"
}

struct StoreBean {
    var dpo: Int
    var storeName: String
    var storeAddress: String
    
    
}

class RealtimeDBService: NSObject {
    
    var storeRef: DatabaseReference = Database.database().reference().child("store")
        
    func addStoreItem(storebean: StoreBean) {
        let childRef = self.storeRef.childByAutoId() // 隨機生成的節點唯一識別碼，用來當儲存時的key值
        let storeItemReference = self.storeRef.child(childRef.key!)
        
        let storeItem: [String : Any] = [StoreKey.dpo.rawValue: storebean.dpo,
                                         StoreKey.storeName.rawValue: storebean.storeName,
                                         StoreKey.storeAddress.rawValue: storebean.storeAddress]
        storeItemReference.setValue(storeItem)
                
    }
        
    func fetchStores(complete: @escaping ([StoreBean]) -> Void ) {
        self.storeRef.observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.childrenCount > 0 {
                var storeList: [StoreBean] = [StoreBean]()
                for item in snapshot.children {
                    let data = self.analys(snapshot: item as! DataSnapshot)
                    storeList.append(data)
                }
                
                complete(storeList)
            } else {
                complete([])
            }
        }
    }
        
    func observeStoreInfoChanged() {
        self.storeRef.observe(.childAdded) { (snapshot) in
            print("childAdded result = \(snapshot.value)")
        }
        
        self.storeRef.observe(.value) { (snapshot) in
            print("store observe = \(snapshot.value)")
        }
    }
    
}

extension RealtimeDBService {
    func analys(snapshot: DataSnapshot) -> StoreBean {
        // 取出snapshot的值(JSON)
        let snapshotValue: [String: AnyObject] = snapshot.value as! [String: AnyObject]
        let bean = StoreBean(dpo: snapshotValue["dpo"] as! Int, storeName: snapshotValue["storeName"] as! String, storeAddress: snapshotValue["storeAddress"] as! String)
        return bean
    }
}
