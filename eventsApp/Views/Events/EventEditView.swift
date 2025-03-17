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
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                
   
                EventForm(event: $event, isCreateForm: false)
                        
                        Button {
                            dismiss()
                        } label: {
                            Text(" Save")
                                .font(.headline)
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, minHeight: 50)
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black.opacity(0.2))
                                .padding(.vertical, 4))
                        
                   
                }
            }
        }
        
    }

