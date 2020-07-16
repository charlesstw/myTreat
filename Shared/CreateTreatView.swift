//
//  CreateTreatView.swift
//  myTreat
//
//  Created by Charles on 2020/7/10.
//

import SwiftUI

struct CreateTreatView: View {
    @State var searchText: String
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text("Filter: \(searchText)")
            Spacer()
        }
        .background(Color.gray)
    }
}

struct CreateTreatView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTreatView(searchText: "")
    }
}
