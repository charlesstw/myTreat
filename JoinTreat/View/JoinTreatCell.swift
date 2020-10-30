//
//  JoinTreatCell.swift
//  myTreat
//
//  Created by Charles on 2020/10/21.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct JoinTreatCell: View {
    @State var campaign: Campaign
    var body: some View {
        NavigationLink(destination: OrderView(campaign: campaign)) {
            
            ZStack(alignment: .topTrailing) {
                HStack {
                    WebImage(url: URL(string: campaign.imageUrl ?? campaign.store.imageUrl))
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .cornerRadius(50)

                    VStack(alignment: .leading) {
                        Text("\(campaign.name)")
                        Text("店家: \(campaign.store.name)")
                        Text("凱子: \(campaign.sponsor)")
                        Text("\(campaign.description)")
                    }
                    Spacer()
                    
                }
                VStack {
                    Text("狀態")
                        .padding(5)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
}

struct JoinTreatCell_Previews: PreviewProvider {
    static var previews: some View {
        JoinTreatCell(campaign: testCampaigns.first!)
    }
}
