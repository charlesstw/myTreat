//
//  StoreBean.swift
//  iOS
//
//  Created by 施詠禎 on 2020/11/9.
//

import Foundation

public struct StoreBean: Codable, Identifiable {
    public let id = UUID()
    let dpo: Int
    let storeName: String
    let storeAddress: String
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case dpo
        case storeName
        case storeAddress
        case imageUrl
    }
}
