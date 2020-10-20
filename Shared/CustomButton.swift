//
//  CustomButton.swift
//  iOS
//
//  Created by JimmyShih on 2020/10/20.
//

import Foundation
import SwiftUI

struct CustomButton: ViewModifier {
    var isEnable = false
    
    func body(content: Content) -> some View {
        return content
            .frame(width: 100, height: 45, alignment: .center)   
            .background(isEnable ? Color.blue : Color.gray)
            .disabled(!isEnable)
            .cornerRadius(10)
            .padding()
            
    }
    
}
