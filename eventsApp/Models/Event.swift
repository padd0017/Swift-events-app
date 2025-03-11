//
//  Event.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import Foundation


struct Event: Identifiable, Equatable {
    var id: UUID
    var name: String
    var startDate: Date
    var endDate: Date?
    var location: String
    var note: String
    var attendees: [Attendee]
    
    
    init(id: UUID = UUID(), name: String = "", startDate: Date = Date(), endDate: Date? = nil, location: String = "", note: String = "", attendees: [Attendee] = []) {
        self.id = id
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.location = location
        self.note = note
        self.attendees = attendees
    }
}


extension Event {
    static let sample = Event(
        name: "Hackathon",
        startDate: Date(),
        location: "San ",
        note: "Let's hack something cool!",
        attendees: [Attendee.sample]
    )
}
