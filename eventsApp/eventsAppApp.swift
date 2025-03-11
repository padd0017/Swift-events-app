//
//  eventsAppApp.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import SwiftUI

@main
struct eventsAppApp: App {
    @StateObject private var dataStore = DataStorage()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataStore)
        }
    }
}
