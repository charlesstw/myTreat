//
//  RegisterView.swift
//  iOS
//
//  Created by JimmyShih on 2020/10/27.
//

import Foundation
import SwiftUI
import Resolver
struct RegisterView: View {
    @State private var emailString = ""
    @State private var passwordString = ""
    @State private var showPwd = false
    @Injected var loginManager: LoginManager
    @State var alertItem: AlertItem?
    
    var isCanLogin: Bool {
        emailString.count > 0 && passwordString.count > 0
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                TextField("email", text: $emailString, onEditingChanged: { (editing) in
                    print("onEditingChanged", editing)
                }) {
                   print(self.emailString)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
            }
            
            HStack {
                Image(systemName: "lock")
                if self.showPwd {
                    TextField("password", text: $passwordString, onCommit:  {
                        print(self.passwordString)
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                } else {
                    SecureField("password", text: $passwordString) {
                       print(self.passwordString)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                }
                Button(action: {
                    self.showPwd.toggle()
                }) {
                    Image(systemName: self.showPwd ? "eye" : "eye.slash")
                }
            }

            // 註冊按鈕
            Button(action: {
                // TODO:present register
                loginManager.createAccount(account: self.emailString, password: self.passwordString) { (error) in
                    if let error = error {
                        self.alertItem = AlertItem(title: Text(error.localizedDescription), dismissButton: .default(Text("確認")))
                    }
                }
            }, label: {
                Text("註冊")
                    .foregroundColor(.white)
            })
            .alert(item: $alertItem, content: { (alertItem) -> Alert in
                return Alert(title: Text("\(alertItem.title)"), dismissButton: alertItem.dismissButton)
            })
            .modifier(CustomButton(isEnable: isCanLogin))
        }                      
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
