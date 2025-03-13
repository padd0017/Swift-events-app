//
//  EventRowView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-12.
//

import SwiftUI


struct EventRowView: View {
    let event: Event
    
    
    var body: some View {
        Text("Hello, World from event row!")
        HStack{
            VStack(alignment: .leading){
                Text(event.name)
                    .font(.headline)
                Text(event.location)
                    .font(.subheadline)
                Text(event.startDate.formatted())
                    .font(.caption)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
