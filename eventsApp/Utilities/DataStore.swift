//
//  DataStorage.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import Foundation


class DataStore: ObservableObject {
    @Published var events: [Event] = [.sample]
    @Published var host: Host = .sample
    
    
    
    func addEvent(_ event: Event) {
        events.append(event)
    }
    
    func deleteEvent(_ event: Event){
        events.removeAll { $0.id == event.id }
    }
}


