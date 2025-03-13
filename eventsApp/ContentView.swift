//
//  ContentView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
          EventsListView()
                .tabItem {
                    Label("Events", systemImage: "list.bullet")
                }
            
          HostProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .tint(.black)
    
    }
}

#Preview {
    ContentView()
        .environmentObject(DataStore())
}
