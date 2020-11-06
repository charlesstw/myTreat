//
//  SelectProductView.swift
//  myTreat
//
//  Created by Charles on 2020/11/3.
//

import SwiftUI

struct SelectProductView: View {
    var product: Product
    var selectProductVM: SelectProductVM
    var shoppingCartVM: ShoppingCartVM
    @Binding var isOrdering: Bool
    @State var count: Int = 1
    
    var body: some View {
        VStack {
            Text("\(product.name)")
                .font(.system(size: 26, weight: .bold, design: .default))
                .padding(5)
            HStack {
                Spacer()
                Button {
                    count = (count - 1) > 0 ? (count - 1) : 0
                    selectProductVM.edit(quantity: count)
                } label: {
                    Text("-")
                        .frame(width: 50, height: 50)
                        .background(Color.clear)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 1)
                        )
                }
                Spacer()
                Text("\(count)")
                Spacer()
                Button {
                    count = count + 1
                    selectProductVM.edit(quantity: count)
                } label: {
                    Text("+")
                        .frame(width: 50, height: 50)
                        .background(Color.clear)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 1)
                        )
                }
                Spacer()
            }
            .padding(5)
            
            if let customItems = product.customItems {
                ForEach(customItems, id:\.name) { item in
                    CustomItemCell(customItem: item, selectProductVM: selectProductVM)
                }
            }
            Button {
                isOrdering.toggle()
                shoppingCartVM.add(product: selectProductVM.product)
            } label: {
                Text("確認")
                .frame(width: 200, height: 44, alignment: .center)
                .background(Color.clear)
                .foregroundColor(Color.white)
                .border(Color.white, width: 1)
//                .cornerRadius(5)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(Color.white, lineWidth: 1)
//                )
            }
        }
        .padding(10)
    }
}
