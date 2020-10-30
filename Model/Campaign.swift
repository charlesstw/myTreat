//
//  Campaign.swift
//  myTreat
//
//  Created by Charles on 2020/10/21.
//

import Foundation

struct Campaign {
    var storeId: String
    var store: String
    var sponsor: String
    var status: String
    var description: String
    var imageUrl: String
    
}

let testCampaigns = [
    Campaign(storeId: "123", store: "50嵐", sponsor: "小明", status: "狀態", description: "小明台幣戰士大家快點餐", imageUrl: "https://scontent.ftpe12-1.fna.fbcdn.net/v/t1.0-9/26001219_1485937951526238_5325475773728439932_n.png?_nc_cat=107&ccb=2&_nc_sid=85a577&_nc_ohc=oUSTk38i9O4AX_L1vJx&_nc_ht=scontent.ftpe12-1.fna&oh=fb7b38c422faa4cf762d0fa033889a79&oe=5FC0639D"),
    Campaign(storeId: "1234", store: "山焙", sponsor: "小強", status: "狀態", description: "小強中樂透點爆他", imageUrl: "https://scontent.ftpe12-2.fna.fbcdn.net/v/t1.0-9/67043004_345879509412302_2338726773480488960_n.jpg?_nc_cat=110&ccb=2&_nc_sid=85a577&_nc_ohc=f7zNpdbmJmMAX9LzuCI&_nc_ht=scontent.ftpe12-2.fna&oh=8dbfa38a276c43794fffbf82265dc251&oe=5FC0AFB6")
]
