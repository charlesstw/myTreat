//
//  Campaign.swift
//  myTreat
//
//  Created by Charles on 2020/10/21.
//

import Foundation

struct Campaign {
    var id: String
    var name: String
    var store: Store
    var sponsor: String
    var status: String
    var description: String
    var imageUrl: String? = nil
}

let testCampaigns = [
    Campaign(id: "123",
             name: "小明請客",
             store: Store(id: "123", name: "50嵐", tel: "0987654321", imageUrl: "https://scontent.ftpe12-1.fna.fbcdn.net/v/t1.0-9/26001219_1485937951526238_5325475773728439932_n.png?_nc_cat=107&ccb=2&_nc_sid=85a577&_nc_ohc=oUSTk38i9O4AX_L1vJx&_nc_ht=scontent.ftpe12-1.fna&oh=fb7b38c422faa4cf762d0fa033889a79&oe=5FC0639D", products: [Product(id: "1", name: "珍奶", desc: "黑糖+鮮奶", price: 100), Product(id: "2", name: "四季珍波耶", desc: "四季春+珍珠+耶果", price: 50)]),
             sponsor: "小明",
             status: "狀態",
             description: "小明台幣戰士大家快點餐", imageUrl: "https://www.worldurbancampaign.org/sites/default/files/Campaign-Kit-Icon.png"),
    Campaign(id: "223",
             name: "小強發大財",
             store: Store(id: "123", name: "山焙", tel: "0988778978", imageUrl: "https://scontent.ftpe12-2.fna.fbcdn.net/v/t1.0-9/67043004_345879509412302_2338726773480488960_n.jpg?_nc_cat=110&ccb=2&_nc_sid=85a577&_nc_ohc=f7zNpdbmJmMAX9LzuCI&_nc_ht=scontent.ftpe12-2.fna&oh=8dbfa38a276c43794fffbf82265dc251&oe=5FC0AFB6", products: [Product(id: "1", name: "金烏拿鐵", desc: "OOLONG LATTA", price: 80), Product(id: "2", name: "山焙黑金", desc: "SUNBAY DARK ROASTED TEA", price: 50)]),
             sponsor: "小強",
             status: "狀態",
             description: "小強中樂透點爆他")
]
