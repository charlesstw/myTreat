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
    case imageUrl = "imageUrl"
}

struct StoreBean: Identifiable {
    var id = UUID()
    var dpo: Int
    var storeName: String
    var storeAddress: String
    var imageUrl: String
}

class RealtimeDBService: NSObject, ObservableObject {
    
    var storeRef: DatabaseReference = Database.database().reference().child("store")
    @Published var list: [StoreBean] = [StoreBean]()
    
    override init() {
        super.init()
        observeStoreInfoChanged()
    }
    
    func addStoreItem(storebean: StoreBean) {
        let storeItemReference = self.storeRef.child(storebean.storeName)
        
        let storeItem: [String : Any] = [StoreKey.dpo.rawValue: storebean.dpo,
                                         StoreKey.storeName.rawValue: storebean.storeName,
                                         StoreKey.storeAddress.rawValue: storebean.storeAddress,
                                         StoreKey.imageUrl.rawValue: storebean.imageUrl]
        storeItemReference.setValue(storeItem)
                
    }
        
    func fetchStores(complete: @escaping ([StoreBean]) -> Void ) {
        self.storeRef.observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.childrenCount > 0 {
                
                var storeList: [StoreBean] = [StoreBean]()
                for item in snapshot.children {
                    let data = self.analys(snapshot: item as! DataSnapshot)
                    storeList.append(data)
                    self.list = storeList
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
            self.list.removeAll()
            var storeList: [StoreBean] = [StoreBean]()
            for item in snapshot.children {
                let data = self.analys(snapshot: item as! DataSnapshot)
                storeList.append(data)
                DispatchQueue.main.async {
                    self.list = storeList
                }
            }
        }
    }
    
}

extension RealtimeDBService {
    func analys(snapshot: DataSnapshot) -> StoreBean {
        // 取出snapshot的值(JSON)
        let snapshotValue: [String: AnyObject] = snapshot.value as! [String: AnyObject]
        let bean = StoreBean(dpo: snapshotValue["dpo"] as! Int, storeName: snapshotValue["storeName"] as! String, storeAddress: snapshotValue["storeAddress"] as! String, imageUrl: snapshotValue["imageUrl"] as! String)
        return bean
    }
    
    private func test() {
        addStoreItem(storebean: StoreBean(dpo: 1, storeName: "Coco", storeAddress: "Taipei", imageUrl: "https://scontent.ftpe12-1.fna.fbcdn.net/v/t1.0-9/26001219_1485937951526238_5325475773728439932_n.png?_nc_cat=107&ccb=2&_nc_sid=85a577&_nc_ohc=oUSTk38i9O4AX_L1vJx&_nc_ht=scontent.ftpe12-1.fna&oh=fb7b38c422faa4cf762d0fa033889a79&oe=5FC0639D"))
        addStoreItem(storebean: StoreBean(dpo: 1, storeName: "方最", storeAddress: "Taipei", imageUrl: "https://scontent.ftpe12-1.fna.fbcdn.net/v/t1.0-9/26001219_1485937951526238_5325475773728439932_n.png?_nc_cat=107&ccb=2&_nc_sid=85a577&_nc_ohc=oUSTk38i9O4AX_L1vJx&_nc_ht=scontent.ftpe12-1.fna&oh=fb7b38c422faa4cf762d0fa033889a79&oe=5FC0639D"))
        addStoreItem(storebean: StoreBean(dpo: 1, storeName: "Cama", storeAddress: "Taipei", imageUrl: "https://scontent.ftpe12-1.fna.fbcdn.net/v/t1.0-9/26001219_1485937951526238_5325475773728439932_n.png?_nc_cat=107&ccb=2&_nc_sid=85a577&_nc_ohc=oUSTk38i9O4AX_L1vJx&_nc_ht=scontent.ftpe12-1.fna&oh=fb7b38c422faa4cf762d0fa033889a79&oe=5FC0639D"))
    }
}
