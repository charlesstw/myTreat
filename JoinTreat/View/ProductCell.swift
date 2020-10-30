//
//  ProductCell.swift
//  myTreat
//
//  Created by Charles on 2020/10/30.
//

import SwiftUI

struct ProductCell: View {
    @State var product: Product
    var body: some View {
        VStack {
            HStack {
                Text("商品名稱：\(product.name)")
                Spacer()
                Text("$ \(product.price)")
            }
            HStack {
                Text("\(product.desc)")
                Spacer()
            }
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: testCampaigns.first!.store.products.first!)
    }
}
