//
//  Attendee.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-16.
//

import SwiftUI

struct AttendeeRowView: View {
    @Binding var attendee: Attendee
    let onDelete: () -> Void
    
    var body: some View {
        HStack{
            Text("\(attendee.firstName) \(attendee.lastName)")
            .font(.headline)
            
            if attendee.isHost {
                           Text("Co-Host")
                               
                       }
            
            Spacer()
            
            Toggle("Co-Host", isOn: $attendee.isHost)
                .labelsHidden()
             
            
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {}
    }
}
