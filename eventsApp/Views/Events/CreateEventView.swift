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
                            TextField("Event Title", text: $event.name)
                                .padding()
                                .font(.subheadline)
                            TextField("Event Location", text: $event.location)
                                .padding()
                                .font(.subheadline)
                            DatePicker("Event Start Date",
                                       selection: $event.startDate, displayedComponents:.date)
                            DatePicker("Event End Date",
                                       selection: $event.endDate, displayedComponents: .date)
                        }
                        .listRowBackground(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(.thinMaterial))
                        
                        
                        Section {
                            TextField("Add a Description",
                                      text: $event.note)
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
                                                               event.attendees.append(Attendee(
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
                                                   
                                                   
                                                   if !event.attendees.isEmpty {
                                                       ForEach($event.attendees) {$attendee in
                                                           AttendeeRowView(attendee: $attendee) {
                                                                      event.attendees.removeAll { $0.id == attendee.id }
                                                                  }
                                                       }
                                                   }
                                               }
                                                   
                                               } //Section attendeee
                        
                        
                        
                        Button {
                            datastore.addEvent(event)
                            dismiss()
                        } label: {
                            Text("Create Event")
                                .font(.headline)
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, minHeight: 50)
                        }
                        .backgroundStyle(Color.white)
                        
                    }  //form
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
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




