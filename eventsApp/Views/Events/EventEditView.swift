//
//  EventDetailView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-12.
//

import SwiftUI


struct EventEditView: View  {
    @EnvironmentObject var datastore: DataStore
    @Environment(\.dismiss) var dismiss
    @Binding var event: Event
    
    var isValid: Bool {
        event.name.isEmpty || event.location.isEmpty  || event.attendees.isEmpty
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                
   
                EventForm(event: $event, isCreateForm: false)
                        
                Button (action: {
                            dismiss()
                        }) {
                            Text(" Save")
                                .font(.headline)
                                .foregroundStyle(
                                    isValid ?.black.opacity(0.2) : .black)
                                .frame(maxWidth: .infinity, minHeight: 50)
                        }
                        .disabled(isValid)
                }
            }
        }
        
    }

