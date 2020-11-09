//
//  FirestoreService.swift
//  iOS
//
//  Created by 施詠禎 on 2020/11/9.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

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
                if let snapshot = querySnapshot {
                    DispatchQueue.main.async {
                        self.storelist = self.StoreSnapshotDecoder(snapshot)
                    }
                }
            }
        }
    }
    
    func observeStoreChanged() {
        
        db.collection("store").addSnapshotListener { (querySnapshot, error) in
            if let err = error {
                print("Error getting documents: \(err)")
            } else {
                if let snapshot = querySnapshot {
                    DispatchQueue.main.async {
                        self.storelist = self.StoreSnapshotDecoder(snapshot)
                    }
                }
            }
        }
    }
}

extension FirestoreService {
    func StoreSnapshotDecoder(_ snapshot: QuerySnapshot) -> [StoreBean] {
        var resultList: [StoreBean] = []
        for document in snapshot.documents {
            
            let result = Result {
                try document.data(as: StoreBean.self)
            }
            switch result {
            case .success(let storeBean):
                if let store = storeBean {
                    print("storeBean: \(store)")
                    resultList.append(store)
                } else {
                    print("Document does not exist")
                }
            case .failure(let error):
                print("Error decoding city: \(error)")
            }
        }
                
        return resultList
    }
}

// for test
extension FirestoreService {
    
    // test指定欲撈取的文件
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
    
    // test撈取資料帶入篩選條件
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

    // test更新店家資訊
    func updateStoreInfo() {
        let storeRef = db.collection("store").document("CoCo")

        storeRef.updateData([
            "storeAddress": "Hello World"
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
