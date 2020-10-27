//
//  LoginView.swift
//  myTreat
//
//  Created by JimmyShih on 2020/10/12.
//

import SwiftUI
import Resolver
struct LoginView: View {
    @State private var emailString = ""
    @State private var passwordString = ""
    @State private var showPwd = false
    @State private var showLogoutAlert = false
    @Injected var loginManager: LoginManager
    @State var alertItem: AlertItem?
    @State var registerTag: Int? = nil
    
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
            
                // 登入按鈕
                Button(action: {
                    print("signIn")
                    loginManager.signInProcess(account: self.emailString, password: self.passwordString) { (error) in
                        let loginResultMsg = (error != nil) ? error?.localizedDescription : "登入成功"
                        
                        self.alertItem = AlertItem(title: Text(loginResultMsg!), dismissButton: .default(Text("確認")))
                    }
                }, label: {
                    Text("登入")
                        .foregroundColor(.white)
                })
                .alert(item: $alertItem, content: { (alertItem) -> Alert in
                    return Alert(title: Text("\(alertItem.title)"), dismissButton: alertItem.dismissButton)
                })
                .modifier(CustomButton(isEnable: isCanLogin))

                // 註冊按鈕
                Button(action: {
                    self.registerTag = 2
                }, label: {
                    Text("註冊")
                        .foregroundColor(.white)
                })
                .modifier(CustomButton(isEnable: true))

                NavigationLink(destination: RegisterView(), tag: 2, selection: $registerTag) {
                    EmptyView()
                }
                
                // 重設按鈕
                Button(action: {
                    self.registerTag = 3
                }, label: {
                    Text("重設密碼")
                        .foregroundColor(.white)
                })
                .modifier(CustomButton(isEnable: true))
                
                NavigationLink(destination: ResetPasswordView(), tag: 3, selection: $registerTag) {
                    EmptyView()
                }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
