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
          EventsListView()
                .tabItem {
                    Label("Events", systemImage: "list.bullet")
                }
            
          HostProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    
    }
}

#Preview {
    ContentView()
        .environmentObject(DataStore())
}
