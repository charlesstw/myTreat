//
//  ShoppingCartCell.swift
//  iOS
//
//  Created by Charles on 2020/11/6.
//

import SwiftUI

struct ShoppingCartCell: View {
    @State var product: OrderedProduct
    var body: some View {
        VStack {
            HStack {
                Text("\(product.name)")
                Spacer()
                Text("$ \(product.price)")
                Text("數量: \(product.quantity)")
            }
            HStack {
                ForEach(product.customItems, id: \.name) { item in
                    Text("\(item.name):\(item.selectItem)")
                }
                Spacer()
            }
        }
    }
}

struct ShoppingCartCell_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartCell(product: testOrderedProduct)
    }
}
