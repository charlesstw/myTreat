//
//  FirestoreService.swift
//  iOS
//
//  Created by 施詠禎 on 2020/11/9.
//

import Foundation
import Firebase

class FirestoreService: NSObject {
    let db = Firestore.firestore()
    
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
