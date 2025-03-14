//
//  HomePageView.swift
//  eventsApp
//
//  Created by Vinaydeep Singh Padda on 2025-03-12.
//

import SwiftUI


struct HomePageView: View {
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView()
                
                
                VStack(spacing: 100) {
                    Text("Welcome to Events App")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black)
                        .padding()
                      
                    
                NavigationLink(destination: CreateEventView()) {
                    Text("Create an Event")
                        .frame(width: 280, height: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
            
        }
       
    }
}
