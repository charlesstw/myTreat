//
//  ContentView.swift
//  Shared
//
//  Created by Charles on 2020/7/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            TabView {                
                JoinTreatView().tabItem {
                    Image(systemName: "photo")
                    Text("被請客")
                }
                CreateTreatView().tabItem {
                    Image(systemName: "camera")
                    Text("我請客")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
