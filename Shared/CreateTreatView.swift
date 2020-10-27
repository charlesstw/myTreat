//
//  CreateTreatView.swift
//  myTreat
//
//  Created by Charles on 2020/7/10.
//

import SwiftUI


struct CreateTreatView: View {
    @State var searchText: String
    @State var showingLogin = false
    var stores = StoreRow.all()
    
    var body: some View {
            NavigationView {
                VStack {
                    HStack {
                        SearchBar(text: $searchText)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            print("start login")
                            self.showingLogin.toggle()
                        }, label: {
                            Image(systemName: "person.circle.fill")
                            Text("登入")
                                
                        })
                        .foregroundColor(.green)
                        .sheet(isPresented: $showingLogin, content: {
                            LoginView()
                        })
                    }
                    ScrollView(.vertical) {
                        let columns = [GridItem(.flexible()), GridItem(.flexible())]
                        LazyVGrid(columns: columns) {
                            ForEach(stores) { store in
                                NavigationLink(destination: CreateOrderView()) {
                                    VStack {
                                        Image(systemName: store.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                            .clipped()
                                            .background(Color.yellow)
                                        Text(store.name)            
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
