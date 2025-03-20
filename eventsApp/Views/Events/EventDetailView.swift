//
//  EventDetailView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-17.
//

import SwiftUI

struct EventDetailView: View {
    @EnvironmentObject var datastore: DataStore
    @Environment(\.dismiss) var dismiss
    @Binding var event: Event
    @State private var showEditView = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Form {
                    // Event Details
                    Section(header: Text("Event Details")) {
                        Text("Name: \(event.name)")
                        Text("Location:  \(event.location)")
                        Text("Notes: \(event.note)")
                        DateText(date: event.startDate)
                        DateText(date: event.endDate)
                    }
                    
                    // Attendees List
                    Section(header: Text("Attendees")) {
                        ForEach(event.attendees) { attendee in
                            HStack {
                                Text("\(attendee.firstName) \(attendee.lastName)")
                                Spacer()
                                if attendee.isHost {
                                    Text("Co-Host")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                
                Button(action: {
                        datastore.deleteEvent(event)
                        dismiss()
                    }) {
                        Text("Delete Event")
                            .font(.headline)
                            .fontWeight(.bold)  
                            .foregroundStyle(.red)
                    }
                    
                    
                
            }
        }
        .navigationTitle("Event Details")
        .toolbar {
            Button("Edit") {
                showEditView = true
            }
        }
        .sheet(isPresented: $showEditView) {
            EventEditView(event: $event)
                .environmentObject(datastore)
        }
    }
}

struct DateText: View {
    let date: Date
    
    var body: some View {
        Text(date.formatted())
    }
}
