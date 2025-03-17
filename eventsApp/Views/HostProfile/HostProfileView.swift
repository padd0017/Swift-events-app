//
//  HostProfileView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-12.
//

import SwiftUI

struct HostProfileView: View {
    @EnvironmentObject var datastore: DataStore
    @Environment(\.dismiss) var dismiss
    
    
    //    @State var host: Host(
    //        firstName: "",
    //        lastName: "",
    //        avatar: "",
    //        isHost: true
    //    )
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                if datastore.host.isHost {
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                        HStack(spacing: 10) {
                            Text("\(datastore.host.firstName) \(datastore.host.lastName)")
                                .font(.headline)
                            
                            Image(systemName: "crown.fill")
                        }
                    }
                    
                } else {
                    Form {
                        Section(header: Text("Create Host")) {
                            TextField("First Name", text: $datastore.host.firstName)
                                .padding()
                                .font(.subheadline)
                            TextField("Last Name", text: $datastore.host.lastName)
                                .padding()
                                .font(.subheadline)
                            
                            Spacer()
                            
                            Button(action: {
                                datastore.host.isHost = true
                                dismiss()
                            }) {
                                Text("Create Host")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 3)
                            }
                            .buttonStyle(PlainButtonStyle()) // Ensures it looks clean
                            .padding(.top, 10)
                        }
                        .listRowBackground(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(.thinMaterial))
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle(Text("Host Profile"))
            .toolbar{
                Button("Sign Out") {
                    datastore.host.isHost = false
              }
        
            }
        }
        
    }
}
