//
//  DataStorage.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import Foundation


class DataStore: ObservableObject {
    @Published var events: [Event] = []
    @Published var host: Host = .sample
    
    
    func addEvent(_ event: Event) {
        events.append(event)
        print("DataStore: ", events)
    }
    
    
    func deleteEvent(_ event: Event){
        events.removeAll { $0.id == event.id }
    }
}


