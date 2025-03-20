//
//  Host.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import Foundation



struct Host: Identifiable, Equatable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var avatar: String
    var isHost: Bool = true
}

extension Host {
    static let sample = Host(
        firstName: "Vinaydeep Singh",
        lastName: "Padda",
        avatar: "person.circle"
    )
}
