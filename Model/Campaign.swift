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
             store: Store(id: "123",
                          name: "50嵐",
                          tel: "0987654321",
                          imageUrl: "https://scontent.ftpe12-1.fna.fbcdn.net/v/t1.0-9/26001219_1485937951526238_5325475773728439932_n.png?_nc_cat=107&ccb=2&_nc_sid=85a577&_nc_ohc=oUSTk38i9O4AX_L1vJx&_nc_ht=scontent.ftpe12-1.fna&oh=fb7b38c422faa4cf762d0fa033889a79&oe=5FC0639D", products: [
                            Product(id: "1",
                                    name: "珍奶",
                                    desc: "黑糖+鮮奶",
                                    price: 100,
                                    customItems:
                                        [CustomItem(name: "冰塊",
                                                     selections: ["正常","去冰"]),
                                         CustomItem(name: "Size",
                                                      selections: ["中","大","特大"])]),
                            Product(id: "2",
                                    name: "四季珍波耶",
                                    desc: "四季春+珍珠+耶果",
                                    price: 50,
                                    customItems:
                                        [CustomItem(name: "甜度",
                                                    selections: ["微糖","正常","無糖","少糖"]),
                                         CustomItem(name: "冰塊",
                                                     selections: ["滿滿冰","正常","小碎冰"])]),
                            Product(id: "3",
                                    name: "蜂蜜檸檬",
                                    desc: "人生短短幾個秋",
                                    price: 60,
                                    customItems:
                                        [CustomItem(name: "蜂蜜",
                                                    selections: ["蜜多","蜜少"]),
                                         CustomItem(name: "酸度",
                                                     selections: ["一點酸","酸酸","爆酸"]),
                                         CustomItem(name: "冰塊",
                                                     selections: ["李冰冰","白冰冰","小小冰"])
                                        ])
                          ]),
             sponsor: "小明",
             status: "狀態",
             description: "小明台幣戰士大家快點餐", imageUrl: "https://www.worldurbancampaign.org/sites/default/files/Campaign-Kit-Icon.png"),
    Campaign(id: "223",
             name: "小強發大財",
             store: Store(id: "123",
                          name: "山焙",
                          tel: "0988778978",
                          imageUrl: "https://scontent.ftpe12-2.fna.fbcdn.net/v/t1.0-9/67043004_345879509412302_2338726773480488960_n.jpg?_nc_cat=110&ccb=2&_nc_sid=85a577&_nc_ohc=f7zNpdbmJmMAX9LzuCI&_nc_ht=scontent.ftpe12-2.fna&oh=8dbfa38a276c43794fffbf82265dc251&oe=5FC0AFB6",
                          products:
                            [Product(id: "1",
                                     name: "金烏拿鐵",
                                     desc: "OOLONG LATTA",
                                     price: 80,
                                     customItems:
                                         [CustomItem(name: "甜度",
                                                     selections: ["微糖","正常","無糖"]),
                                          CustomItem(name: "冰塊",
                                                      selections: ["少冰","正常","去冰"])]),
                             Product(id: "2",
                                     name: "山焙黑金",
                                     desc: "SUNBAY DARK ROASTED TEA",
                                     price: 50,
                                     customItems:
                                         [CustomItem(name: "甜度",
                                                     selections: ["微糖","正常","無糖"]),
                                          CustomItem(name: "冰塊",
                                                      selections: ["少冰","正常","去冰"])])]),
             sponsor: "小強",
             status: "狀態",
             description: "小強中樂透點爆他"),
    Campaign(id: "3",
             name: "小強發大財",
             store: Store(id: "123",
                          name: "派克雞排",
                          tel: "0988778978",
                          imageUrl: "https://scontent.ftpe12-2.fna.fbcdn.net/v/t1.0-9/49725048_2353585721383546_8886642159852191744_n.jpg?_nc_cat=109&ccb=2&_nc_sid=85a577&_nc_ohc=7fwF4TTvS0IAX_ymlm8&_nc_ht=scontent.ftpe12-2.fna&oh=623887b6dff871d7004230b147dfe2c1&oe=5FCA7B5D",
                          products:
                            [Product(id: "1",
                                     name: "派克雞排",
                                     desc: "🐔",
                                     price: 80,
                                     customItems:
                                         [CustomItem(name: "辣",
                                                     selections: ["小辣","辣辣","大辣"]),
                                          CustomItem(name: "切",
                                                      selections: ["切","不切"])]),
                             Product(id: "2",
                                     name: "派克雞塊",
                                     desc: "🐥🐥🐥",
                                     price: 50,
                                     customItems:
                                         [CustomItem(name: "辣",
                                                     selections: ["小辣","辣辣","大辣"]),
                                          CustomItem(name: "胡椒",
                                                      selections: ["不加","正常","多"])])]),
             sponsor: "派克",
             status: "狀態",
             description: "派克請吃派克")
]
