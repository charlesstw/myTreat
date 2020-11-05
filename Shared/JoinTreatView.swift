//
//  JoinTreatView.swift
//  myTreat
//
//  Created by Charles on 2020/7/10.
//

import SwiftUI

struct JoinTreatView: View {
    var viewModel: JoinTreatVM
    var body: some View {
        NavigationView {
            List(viewModel.campaigns, id: \.id) { campaign in
                JoinTreatCell(campaign: campaign)
            }
            .navigationTitle("點起來")
        }        
    }
}

struct JoinTreatView_Previews: PreviewProvider {
    static var previews: some View {
        JoinTreatView(viewModel: JoinTreatVM())
    }
}
