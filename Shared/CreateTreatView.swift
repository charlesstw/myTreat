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
                        .foregroundColor(.white)
                        .sheet(isPresented: $showingLogin, content: {
                            LoginView()
                        })
                    }
                    Spacer()
                    NavigationLink(destination: CreateOrderView()) {
                              Text("todo:店家cell，進入建立表單頁")
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
