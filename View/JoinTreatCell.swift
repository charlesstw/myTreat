//
//  JoinTreatCell.swift
//  myTreat
//
//  Created by Charles on 2020/10/21.
//

import Foundation
import SwiftUI

struct JoinTreatCell: View {
    @State var campaign: Campaign
    var body: some View {
        HStack {
            Image("").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading).cornerRadius(50)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("店名: xxx")
                    Spacer()
                    Text("發起人: xxx")
                    Text("狀態").padding(8).background(Color.blue).foregroundColor(.white)
                }
                
                Text("描述")
            }
        }
    }
}

struct JoinTreatCell_Previews: PreviewProvider {
    static var previews: some View {
        JoinTreatCell(campaign: Campaign())
    }
}
