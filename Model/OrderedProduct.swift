//
//  OrderedProduct.swift
//  iOS
//
//  Created by Charles on 2020/11/6.
//

import Foundation

struct OrderedProduct: Equatable {
    var id: String
    var name: String
    var price: Int
    var quantity: Int
    var imageUrl: String? = nil
    var customItems: [CustomItem] = []
    var additionalItems: [String] = []
    
    init(product: Product) {
        id = product.id
        name = product.name
        price = product.price
        quantity = 1
    }
    
    struct CustomItem {
        var name: String
        var value: String
    }
    
    static func == (lhs: OrderedProduct, rhs: OrderedProduct) -> Bool {
        return lhs.id == rhs.id        
    }
}


let testOrderedProduct = OrderedProduct(product: testCampaigns.first!.store.products.first!)
