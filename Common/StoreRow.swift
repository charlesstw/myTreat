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
        return [StoreRow(name: "CoCo", imageName: "trash"),
                StoreRow(name: "50 lan", imageName: "trash.fill"),
                StoreRow(name: "Sunbay", imageName: "trash.slash"),
                StoreRow(name: "kebuke", imageName: "trash.slash.fill")]
    }
}
