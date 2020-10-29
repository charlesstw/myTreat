//
//  StoreRow.swift
//  myTreat
//
//  Created by JimmyShih on 2020/10/22.
//

import Foundation

struct StoreRow: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
}

extension StoreRow {
    static func all() -> [StoreRow] {
        return [StoreRow(name: "山焙", imageName: "sunbay"),                
                StoreRow(name: "Cama", imageName: "cama"),
                StoreRow(name: "CoCo", imageName: "coco"),
                StoreRow(name: "可不可熟成紅茶", imageName: "kebuke"),
                StoreRow(name: "方最", imageName: "fanzui")]
    }
}
