//
//  Event.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import Foundation


struct Event: Identifiable {
    let id = UUID()
    var name: String
    var startDate: Date
    var endDate: Date
    var location: String
    var note: String
    var attendees: [Attendee]
    
}



