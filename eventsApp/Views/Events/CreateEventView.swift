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
                    
                    EventForm(event: $event, isCreateForm: true)
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



