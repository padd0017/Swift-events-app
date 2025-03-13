import SwiftUI

struct EventsListView: View {
    @EnvironmentObject var dataStore: DataStore
    
    var upcomingEvents: [Event] {
       let filtered = dataStore.events.filter { $0.startDate > Date() }
//        print("Upcoming event: ", filtered)
        return filtered
    }
    
    var pastEvents: [Event] {
        dataStore.events.filter { $0.startDate <= Date() }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(
                    colors: [.brown, .red, .white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea(edges: .all)
                
                VStack(alignment: .center) {
                    List {
                        
                        // Upcoming events
                        Section(header: Text("Upcoming Events")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        ) {
                            if upcomingEvents.isEmpty {
                                Text("No Upcoming Events")
                                    .foregroundStyle(.red)
                            } else {
                                ForEach(upcomingEvents, id: \.id) { event in
                                    HStack {
                                        NavigationLink(destination: EventDetailView(event: event)) {
                                                EventRowView(event: event)
                                        }
                                        Spacer()
                                        // Delete Button
//                                        Button(action: {
//                                            dataStore.deleteEvent(event)
//                                        }) {
//                                            Image(systemName: "trash")
//                                                .foregroundColor(.red)
//                                        }
//                                        .padding(.trailing, 10) // Add some padding to the button
                                    }
                                }
                            }
                        }
                        
                        
                        
                        Section (header: Text("Past Events")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        ) {
                            if(pastEvents.isEmpty) {
                                Text("No Past Events")
                                    .foregroundStyle(.red)
                            
                            } else {
                                ForEach(pastEvents, id: \.id) { event in
                                    HStack{
                                        NavigationLink(destination: EventDetailView(event: event)) {
                                            EventRowView(event: event)
                                        }
                                    }
                                }
                            }
                        }
                    }
                  
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

        



