//
//  OrderView.swift
//  myTreat
//
//  Created by Charles on 2020/10/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderView: View {
    var campaign: Campaign
    @State var isOrdering: Bool = false
    @State var currentProduct: Product? = nil
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                OrderHeaderView(campaign: campaign)
                ForEach(campaign.store.products, id: \.id) { product in
                    ProductCell(product: product)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if !isOrdering {
                                isOrdering.toggle()
                                currentProduct = product
                                print("isOrder \(isOrdering)")
                                print("Selected \(product.name)")
                            }
                        }
                }
            }
            .navigationTitle(campaign.name)
            
            if let currentProduct = currentProduct, isOrdering {
                SelectProductView(product: currentProduct, isOrdering: $isOrdering)
                    .background(Color(UIColor.darkGray))
                    .cornerRadius(10)
                    .padding(10)
            }
        }
    }
}

struct OrderHeaderView: View {
    var campaign: Campaign
    var body: some View {
        HStack {
            WebImage(url: URL(string: campaign.store.imageUrl))
                .resizable()
                .frame(width: 150, height: 150, alignment: .leading)
                .cornerRadius(50)

            VStack(alignment: .leading) {
                Text("店名: \(campaign.store.name)")
                Text("發起人: \(campaign.sponsor)")
                Text("\(campaign.description)")

            }
            Spacer()
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(campaign: testCampaigns.first!)
    }
}
