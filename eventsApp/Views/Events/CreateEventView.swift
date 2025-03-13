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
    @State var createEvent: Event = Event(
        name: "",
        startDate: Date(),
        endDate:  Date(),
        location: "",
        note: "",
        attendees: []
    )
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(
                    colors: [ .brown, .red, .white]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .ignoresSafeArea(edges: .all)
                
                VStack {
                    Form {
                        Section(header: Text("New Event")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        ) {
                            TextField("Event Title", text: $createEvent.name)
                                .padding()
                                .font(.subheadline)
                            TextField("Event Location", text: $createEvent.location)
                                .padding()
                                .font(.subheadline)
                            DatePicker("Event Start Date",
                                       selection: $createEvent.startDate, displayedComponents:.date)
                            DatePicker("Event End Date",
                                       selection: $createEvent.endDate, displayedComponents: .date)
                            
                            
                        }
                        .listRowBackground(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(.thinMaterial))
                        
                        Section {
                            TextField("Add a Description",
                                      text: $createEvent.note)
                                .padding()
                        }
                        .listRowBackground(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.thinMaterial))
                        
                        Button {
                            datastore.addEvent(createEvent)
                            dismiss()
                        } label: {
                            Text("Create Event")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                        }
                        .listRowBackground(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black.opacity(0.2))
                                .padding(.vertical, 4))
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
            }
            .onAppear {
                createEvent = Event(
                       name: "",
                       startDate: Date(),
                       endDate: Date(),
                       location: "",
                       note: "",
                       attendees: []
                   )
            }
        }
    }
}
