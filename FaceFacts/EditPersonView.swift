//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Or Israeli on 16/01/2024.
//

import SwiftData
import SwiftUI

struct EditPersonView: View {
	@Environment(\.modelContext) var modelContext
	@Bindable var person: Person
	@Binding var navigationPath: NavigationPath
	
	@Query(sort: [
		SortDescriptor(\Event.name),
		SortDescriptor(\Event.location)
	]) var events: [Event]
	
    var body: some View {
		Form {
			Section {
				TextField("Name", text: $person.name)
					.textContentType(.name)
				
				TextField("Email address", text: $person.emailAddress)
					.keyboardType(.emailAddress)
					.textContentType(.emailAddress)
					.textInputAutocapitalization(.never)
			}
			
			Section("Where did you meet them?") {
				Picker("Met at", selection: $person.metAt) {
					Text("Unknown Event")
						.tag(Optional<Event>.none)
					
					if events.isEmpty == false {
						Divider()
						
						ForEach(events) { event in
							Text(event.name)
								.tag(Optional(event))
						}
					}
				}
				
				Button("Add a new event", action: addEvent)
			}
			
			Section("Notes") {
				TextField("Details about this person", text: $person.details, axis: .vertical)
			}
		}
		.navigationTitle("Edit Person")
		.navigationBarTitleDisplayMode(.inline)
		.navigationDestination(for: Event.self) { event in
				EditEventView(event: event)
		}
    }
	
	func addEvent() {
		let event = Event(name: "", location: "")
		modelContext.insert(event)
		navigationPath.append(event)
	}
}

//#Preview {
//    EditPersonView(person: Person(name: "Keanu Reeves", emailAddress: "kreeves@exmaple.com", details: "matrix"))
//}
