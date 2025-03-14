import SwiftUI

struct EventsListView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var selectedEvent: Event? 
    
    var upcomingEvents: [Event] {
      dataStore.events.filter { $0.startDate > Date() }
    }
    
    var pastEvents: [Event] {
        dataStore.events.filter { $0.startDate <= Date() }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
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
                                    if let index = dataStore.events.firstIndex(where: { $0.id == event.id }) {
                                        NavigationLink(destination: EventDetailView(event: $dataStore.events[index])) {
                                            EventRowView(event: event)
                                        }
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
                                    if let index = dataStore.events.firstIndex(where: { $0.id == event.id }) {
                                        NavigationLink(destination: EventDetailView(event: $dataStore.events[index])) {
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



        
