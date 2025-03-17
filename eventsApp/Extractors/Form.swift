//
//  Form.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-17.
//

import SwiftUI


struct EventForm: View {
    @Binding var event: Event
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    let isCreateForm: Bool
    
    var body: some View {
        Form {
            Section(header: Text(isCreateForm ? "New Event" : "Edit Event Details")
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
                                                       firstName: firstName,
                                                       lastName: lastName,
                                                       avatar: "",
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
                                   .listRowBackground(
                                           RoundedRectangle(cornerRadius: 0)
                                               .fill(.thinMaterial))//Section attendeee
    }  //form
        .scrollContentBackground(.hidden)
        .background(Color.clear)
    }
}
