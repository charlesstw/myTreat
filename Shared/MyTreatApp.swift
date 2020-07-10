//
//  myTreatApp.swift
//  Shared
//
//  Created by Charles on 2020/7/10.
//

import SwiftUI
import Firebase

@main
struct MyTreatApp: App {
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct myTreatApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
