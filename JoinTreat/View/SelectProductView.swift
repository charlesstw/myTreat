//
//  SelectProductView.swift
//  myTreat
//
//  Created by Charles on 2020/11/3.
//

import SwiftUI

struct SelectProductView: View {
    var product: Product
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
                } label: {
                    Text("-")
                        .frame(width: 44, height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .cornerRadius(5)
                }
                Spacer()
                Text("\(count)")
                Spacer()
                Button {
                    count = count + 1
                } label: {
                    Text("+")
                        .frame(width: 44, height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .cornerRadius(5)
                }
                Spacer()
            }
            .padding(5)
            
            if let customItems = product.customItems {
                ForEach(customItems, id:\.name) { item in
                    CustomItemCell(customItem: item)
                }
            }
            Button {
                isOrdering.toggle()
            } label: {
                Text("確認")
                .frame(width: 200, height: 40, alignment: .center)
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(5)
            }
        }
        .padding(10)
    }
}
