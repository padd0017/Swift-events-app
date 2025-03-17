//
//  EventDetailView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-12.
//

import SwiftUI


struct EventDetailView: View  {
    @EnvironmentObject var dataStore: DataStore
    @Environment(\.dismiss) var dismiss
    @Binding var event: Event
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                
                Form {
                    Section(header: Text("Edit Event Details")
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
                        
                        
                        Button {
                            dismiss()
                        } label: {
                            Text(" Save")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black.opacity(0.2))
                                .padding(.vertical, 4))
                        
                        Button {
                            dataStore.deleteEvent(event)
                            dismiss()
                            
                        } label: {
                            Text("Cancel")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                            
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                                .padding(.vertical, 4))
                        
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
            }
        }
        
    }
}
