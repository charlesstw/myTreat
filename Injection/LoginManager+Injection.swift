//
//  LoginManager+Injection.swift
//  iOS
//
//  Created by JimmyShih on 2020/10/20.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerLoginServices() {
        register { LoginManager.shared }        
    }
}
