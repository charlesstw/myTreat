//
//  SelectProductVM.swift
//  iOS
//
//  Created by Charles on 2020/11/6.
//

import SwiftUI

class SelectProductVM {
    var product: OrderedProduct
    
    init(orderedProduct: OrderedProduct) {
        self.product = orderedProduct
    }
    
    func edit(quantity: Int) {
        product.quantity = quantity
    }
    
    func addCustomItem(name: String, selectItem: String) {
        let addCustomItem = OrderedProduct.CustomItem(name: name, value: selectItem)
        if let index = product.customItems.firstIndex(where: { $0.name == addCustomItem.name }) {
            product.customItems.remove(at: index)
        }
        product.customItems.append(addCustomItem)
    }
    
    func getCustomSelectValue(name: String) -> String {
        if let item = product.customItems.first(where: { $0.name == name }) {
            return item.value
        }
        return ""
    }
}
