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
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
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
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
        }
    }
}
