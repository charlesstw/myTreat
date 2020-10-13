//
//  ResolverManager.swift
//  myTreat
//
//  Created by JimmyShih on 2020/10/13.
//

import Foundation
import Resolver

class ResolverManager: NSObject {
    static let shared = ResolverManager()
    var resolver = Resolver()
    
    private override init() {
        super.init()
        setupMyRegistrations()
    }
}

extension ResolverManager: Resolving {
    func setupMyRegistrations() {
        resolver.register { LoginManager.shared }
    }
}
