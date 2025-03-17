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
    
    @State private var firstName: String = ""
      @State private var lastName: String = ""
    
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
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
                        
                        
                        Section(header: Text("Add an attendee")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                        ){
                            HStack {
                                TextField("First Name", text: $firstName)
                                TextField("last Name", text: $lastName)
                                
                                Button(action: {
                                    if !firstName.isEmpty  && !lastName.isEmpty {
                                        createEvent.attendees.append(Attendee(
                                            id: UUID(),
                                            firstName: firstName,
                                            lastName: lastName,
                                            isHost: false
                                    ))
                                        firstName = ""
                                        lastName = ""
                                    }
                                }){
                                    Text("Add")
                                }
                            }
                            
                            
                            if !createEvent.attendees.isEmpty {
                                ForEach($createEvent.attendees) {$attendee in
                                    AttendeeRowView(attendee: $attendee) {
                                               createEvent.attendees.removeAll { $0.id == attendee.id }
                                           }
                                }
                            }
                        }
                            
                        } //Section attendeee
                        
                        
                        
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
                        
                    }  //form
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
                       attendees: [])
            }//onappear
        }
    }




