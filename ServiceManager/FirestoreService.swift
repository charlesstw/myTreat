//
//  FirestoreService.swift
//  iOS
//
//  Created by 施詠禎 on 2020/11/9.
//

import Foundation
import Firebase

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

class FirestoreService: NSObject, ObservableObject {
    let db = Firestore.firestore()
    @Published var storelist: [StoreBean] = [StoreBean]()
    
    override init() {
        super.init()
        observeStoreChanged()
    }
    
    func getStores() {
        let storeRef = db.collection("store")
        storeRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                    print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("[jimmy]\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    func observeStoreChanged() {
        db.collection("store").addSnapshotListener { (querySnapshot, error) in
            if let err = error {
                print("Error getting documents: \(err)")
            } else {
                self.storelist.removeAll()
                var storeList: [StoreBean] = [StoreBean]()
                for document in querySnapshot!.documents {
                    let data = self.analys(snapshot: document.data())
                    storeList.append(data)
                    DispatchQueue.main.async {
                        self.storelist = storeList
                    }
                }
            }
        }
    }
}

extension FirestoreService {
    func analys(snapshot: [String: Any]) -> StoreBean {
        // 取出snapshot的值(JSON)
        let bean = StoreBean(dpo: snapshot["dpo"] as! Int, storeName: snapshot["storeName"] as! String, storeAddress: snapshot["storeAddress"] as! String, imageUrl: snapshot["imageUrl"] as! String)
        return bean
    }
}

// for test
extension FirestoreService {
    func getStoreCoco() {
        let docRef = db.collection("store").document("Coco")

        // Force the SDK to fetch the document from the cache. Could also specify
        // FirestoreSource.server or FirestoreSource.default.
        docRef.getDocument(source: .cache) { (document, error) in
          if let document = document {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Cached document data: \(dataDescription)")
          } else {
            print("Document does not exist in cache")
          }
        }
    }
    func getStoreFilterByDpo() {
        db.collection("store").whereField("dpo", isEqualTo: 0)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("[jimmy]\(document.documentID) => \(document.data())")
                    }
                }
        }
    }
}
