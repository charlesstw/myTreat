//
//  RealtimeDBService.swift
//  iOS
//
//  Created by JimmyShih on 2020/10/28.
//

import Foundation
import FirebaseDatabase
class RealtimeDBService: NSObject {
    
    var ref: DatabaseReference = Database.database().reference()
    
}
