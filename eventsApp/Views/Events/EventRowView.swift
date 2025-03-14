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
        HStack{
            VStack(alignment: .leading){
                Text(event.name)
                    .font(.headline)
                Text(event.location)
                    .font(.subheadline)
            }
            
        }
        .padding(.vertical, 8)
    }
}
