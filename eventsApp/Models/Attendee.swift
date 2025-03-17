//
//  Attendee.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import Foundation

struct Attendee: Identifiable{
    let id : UUID = UUID()
    var firstName: String
    var lastName: String
    var avatar: String
    var isHost: Bool
}

