//
//  CustomItemCell.swift
//  myTreat
//
//  Created by Charles on 2020/11/3.
//

import SwiftUI

struct CustomItemCell: View {
    var customItem: Product.CustomItem
    var selectProductVM: SelectProductVM
    @State var selectedCustomItem = ""
    var body: some View {
        HStack {
            Text("\(customItem.name)")
            Picker(selection: $selectedCustomItem, label: Text("請選擇")) {
                ForEach(customItem.selections, id:\.self) { customSelection in
                    Text(customSelection)
                }
            }
            .onChange(of: selectedCustomItem, perform: { (_) in
                selectProductVM.addCustomItem(name: customItem.name, selectItem: selectedCustomItem)
            })
            .pickerStyle(SegmentedPickerStyle())
            .frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .center)
            .clipped()
            .cornerRadius(10)
        }
        .padding(5)
    }
}
