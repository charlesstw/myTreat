//
//  CreateTreatView.swift
//  myTreat
//
//  Created by Charles on 2020/7/10.
//

import SwiftUI
import SDWebImageSwiftUI

struct CreateTreatView: View {
    @State var searchText: String
    @State var showingLogin: Int? = nil
    var stores = StoreRow.all()
    @ObservedObject var dbService: RealtimeDBService = RealtimeDBService()
    var body: some View {
        
            NavigationView {
                VStack {
                    HStack {
                        SearchBar(text: $searchText)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            print("start login")
                            self.showingLogin = 1
                        }, label: {
                            Image(systemName: "person.circle.fill")
                            Text("登入")
                        })
                        .foregroundColor(.green)
                        
                        NavigationLink(destination: LoginView(), tag: 1, selection: $showingLogin) {
                            EmptyView()
                          }
                    }
                    
                    ScrollView(.vertical) {
                        let columns = [GridItem(.flexible()), GridItem(.flexible())]
                        LazyVGrid(columns: columns) {
                            
                            ForEach(dbService.list) { store in
                                NavigationLink(destination: CreateOrderView()) {
                                    VStack {
                                        WebImage(url: URL(string: store.imageUrl))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                            .clipped()
                                            .background(Color.yellow)                                    
                                        Text(store.storeName)
                                    }
                                }
                            }
                        }
                    }
                       
                    Spacer()
                }
                .padding()
                .navigationBarTitle("請客選項：")
            }            
            .background(Color.gray)
            
    }
}

struct CreateTreatView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTreatView(searchText: "")
    }
}
