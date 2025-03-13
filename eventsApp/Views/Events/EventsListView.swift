//
//  EventsListView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-11.
//

import SwiftUI

struct EventsListView: View {
    //    @EnvironmentObject var dataStore: DataStore
    //
    //    var upcomingEvents: [Event] {
    //        dataStore.events.filter { $0.startDate > Date() }
    //    }
    //
    //    var pastEvents: [Event] {
    //        dataStore.events.filter { $0.startDate <= Date() }
    //    }
    
    var body: some View {
        Text("Events Page")
        //        NavigationStack {
        //            List {
        //                // Upcoming Events
        //                Section("Upcoming") {
        //                    if upcomingEvents.isEmpty {
        //                        Text("No Upcoming Events.")
        //                            .foregroundColor(.gray)
        //                    } else {
        //                        ForEach(upcomingEvents) { event in
        //                            HStack {
        //                                NavigationLink(destination: EventRowView(event: event)) { // Ensure EventDetailView exists
        //                                    Text(event.name)
        //                                        .padding()
        //                                }
        //
        //                                Spacer()
        //
        //                                Button(action: {
        //                                    dataStore.deleteEvent(event)
        //                                }) {
        //                                    Image(systemName: "trash")
        //                                        .foregroundColor(.red)
        //                                }
        //                                .padding(.trailing, 10)
        //                            }
        //                        }
        //                    }
        //                }
        //                
        //                // Past Events
        //                Section("Past") {
        //                    if pastEvents.isEmpty {
        //                        Text("No Past Events.")
        //                            .foregroundColor(.gray)
        //                    } else {
        //                        ForEach(pastEvents) { event in
        //                            HStack {
        //                                NavigationLink(destination: EventRowView(event: event)) {
        //                                    Text(event.name)
        //                                        .padding()
        //                                }
        //                                Spacer()
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //            .navigationTitle("Events") 
        //        }
        //    }
    }
}
        



