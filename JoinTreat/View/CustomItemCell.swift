//
//  CustomItemCell.swift
//  myTreat
//
//  Created by Charles on 2020/11/3.
//

import SwiftUI

struct CustomItemCell: View {
    var customItem: CustomItem
    @State private var selectedCustomItem = ""
    var body: some View {
        HStack {
            Text("\(customItem.name)")
            Picker(selection: $selectedCustomItem, label: Text("請選擇")) {
                ForEach(customItem.selections, id:\.self) { customSelection in
                    Text(customSelection)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 150, height: 40)
            .clipped()
            .cornerRadius(10)
        }
        .padding(5)
    }
}
