//
//  CreateEventView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-12.
//

import SwiftUI
import Foundation

struct CreateEventView: View {
    @EnvironmentObject var datastore: DataStore
    @Environment(\.dismiss) var dismiss 
    @State var event: Event = Event(
        name: "",
        startDate: Date(),
        endDate:  Date(),
        location: "",
        note: "",
        attendees: []
    )
    
    var isValid: Bool {
        event.name.isEmpty || event.location.isEmpty  || event.attendees.isEmpty
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack {
                    
                    EventForm(event: $event, isCreateForm: true)
                    Button (action: {
                        datastore.addEvent(event)
                        dismiss()
                    }) {
                        Text("Create Event")
                            .font(.headline)
                            .foregroundStyle(
                                isValid ?.black.opacity(0.2) : .black)
                            .frame(maxWidth: .infinity, minHeight: 50)
                        
                    }
                    .disabled(isValid)
                    
                }
            }
            .onAppear {
                event = Event(
                    name: "",
                    startDate: Date(),
                    endDate: Date(),
                    location: "",
                    note: "",
                    attendees: [])
            }//onappear
        }
    }
}



