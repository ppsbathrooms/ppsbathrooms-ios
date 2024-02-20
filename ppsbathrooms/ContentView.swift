//
//  ContentView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .map
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    FranklinMapView()
                        .background(Color("121211"))
                        .tag(Tab.map)
                    ProfileView()
                        .tag(Tab.person)
                    SettingsView()
                        .tag(Tab.gearshape)
                }
            }
            VStack {
                Spacer()
                TabBarView(selectedTab: $selectedTab)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    ContentView()
}
