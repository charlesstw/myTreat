//
//  MyTreatApp+Injection.swift
//  iOS
//
//  Created by JimmyShih on 2020/10/20.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerLoginServices()
    }
}
