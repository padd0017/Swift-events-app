//
//  Attendee.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import Foundation

struct Attendee: Identifiable, Equatable {
    let id: UUID
    var firstName: String
    var lastName: String
    var avatar: String
    var isHost: Bool
    
    
    
    init(id: UUID = UUID(), firstName: String = "", lastName: String = "", avatar: String = "person.circle", isHost: Bool = false) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.isHost = isHost
    }
}


extension Attendee {
    static let sample = Attendee(
        firstName: "Neha",
        lastName: "Sareen",
        avatar: "person.crop.circle"
    )
}
