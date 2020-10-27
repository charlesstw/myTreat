//
//  ResetPasswordView.swift
//  iOS
//
//  Created by JimmyShih on 2020/10/27.
//

import Foundation
import SwiftUI
import Resolver
struct ResetPasswordView: View {
    @State private var emailString = ""
    @State private var showPwd = false
    @Injected var loginManager: LoginManager
    @State var alertItem: AlertItem?
    
    var isCanLogin: Bool {
        emailString.count > 0
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
                    
            // 重設按鈕
            Button(action: {
                loginManager.resetPassword(email: emailString) { (error) in
                    if let error = error {
                        self.alertItem = AlertItem(title: Text(error.localizedDescription), dismissButton: .default(Text("確認")))
                    } else {                        
                        self.alertItem = AlertItem(title: Text("重設信件已發送至\(emailString)"), dismissButton: .default(Text("確認")))
                        emailString = ""
                    }
                }
            }, label: {
                Text("重設密碼")
                    .foregroundColor(.white)
            })
            .alert(item: $alertItem, content: { (alertItem) -> Alert in
                return Alert(title: Text("\(alertItem.title)"), dismissButton: alertItem.dismissButton)
            })
            .modifier(CustomButton(isEnable: isCanLogin))
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
