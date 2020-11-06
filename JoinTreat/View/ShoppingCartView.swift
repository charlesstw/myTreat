//
//  ShoppingCartView.swift
//  iOS
//
//  Created by Charles on 2020/11/6.
//

import SwiftUI

struct ShoppingCartView: View {
    var shoppiongCartVM: ShoppingCartVM
    var body: some View {
        List {
            ForEach(shoppiongCartVM.products, id: \.id) { product in
                ShoppingCartCell(product: product)
            }
        }.navigationTitle("購物車明細")
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView(shoppiongCartVM: ShoppingCartVM())
    }
}
