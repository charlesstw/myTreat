//
//  LoginView.swift
//  myTreat
//
//  Created by JimmyShih on 2020/10/12.
//

import SwiftUI

struct LoginView: View {
    @State private var emailString = ""
    @State private var passwordString = ""
    private let loginManager = LoginManager()
    
    var body: some View {
        
        VStack {
            //
            TextField("email", text: $emailString, onEditingChanged: { (editing) in
                print("onEditingChanged", editing)
            }) {
               print(self.emailString)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.emailAddress)
            .padding()
            
            //
            SecureField("password", text: $passwordString) {
               print(self.passwordString)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.emailAddress)
            .padding()
            
            //
            Button(action: {
                print("login")
                loginManager.loginProcess(account: self.emailString, password: self.passwordString)
            }, label: {
                Text("login")
            })
            .padding()
            
            Button(action: {
                // TODO:present regist
            }, label: {
                Text("註冊")
            })
            .padding()
            
            Button(action: {
                
            }, label: {
                Text("重設密碼")
            })
            .padding()
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
