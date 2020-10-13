//
//  LoginManager.swift
//  myTreat
//
//  Created by JimmyShih on 2020/10/12.
//

import Foundation
import Firebase
import FirebaseAuth

class LoginManager: NSObject {
    static let shared = LoginManager()

    private override init() {
        super.init()        
    }
    
    func isLogined() -> Bool {
        if let user = Auth.auth().currentUser {
            print("\(user.email) login")
            return true
        } else {
            print("not login")
            return false
        }
    }
    
    func signInProcess(account: String, password: String, completion:@escaping ((Error?) -> Void)) {
        print("send email:\(account), pwd:\(password)")
        // todo: firebase auth
        Auth.auth().signIn(withEmail: account, password: password) { (result, error) in
            if error == nil {
                print("You have successfully sign In")
                completion(nil)
            } else {
                print(error)
                completion(error)
            }
        }
    }
    
    func signOutProcess() {
        print("logoutProcess")
        if self.isLogined() {
            do {
               try Auth.auth().signOut()
            } catch {
               print(error)
            }
        }
    }
    
    func createAccount(account: String, password: String, completion:@escaping ((Error?) -> Void)) {
        Auth.auth().createUser(withEmail: account, password: password) { (user, error) in
                    if error == nil {
                        print("You have successfully signed up")
                        //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                        completion(nil)
                    } else {
                        print(error)
                        completion(error)
                    }
                }        
    }
    
    func resetPassword() {
        
    }
}
