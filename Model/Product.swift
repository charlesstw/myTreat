//
//  Product.swift
//  myTreat
//
//  Created by Charles on 2020/10/30.
//

import Foundation

struct Product {
    var id: String
    var name: String
    var desc: String
    var price: Int
    var imageUrl: String? = nil
    var customItems: [CustomItem] = []
    var additionalItems: [String] = []
    
    struct CustomItem {
        var name: String
        var selections: [String]
    }
}


