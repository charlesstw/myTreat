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
    var body: some View {

        List {
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
            }.onTapGesture {
                print("ttt11")
            }
            ForEach(campaign.store.products, id: \.id) { product in
                ProductCell(product: product)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("tap")
                    }

            }
        }
        .navigationTitle("")

    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(campaign: testCampaigns.first!)
    }
}
