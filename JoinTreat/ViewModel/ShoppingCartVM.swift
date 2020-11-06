//
//  ShoppingCartVM.swift
//  iOS
//
//  Created by Charles on 2020/11/6.
//

import SwiftUI

class ShoppingCartVM {
    var products = [OrderedProduct]()
    
    func add(product: OrderedProduct) {
        if let index = products.firstIndex(where: { $0 == product }) {
            products.remove(at: index)
        }
        if product.quantity != 0 {
            products.append(product)
        }        
    }
    
    func delete(product: OrderedProduct) {
        if let index = products.firstIndex(where: { $0 == product }) {
            products.remove(at: index)
        }
    }
    
    func getOrderedProduct(product: Product) -> OrderedProduct {
        var orderedProduct = OrderedProduct(product: product)
        if let previousOrdered = products.first(where: { $0.id == product.id }) {
            orderedProduct = previousOrdered
        }
        return orderedProduct
    }
}
