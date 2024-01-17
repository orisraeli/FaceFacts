//
//  ContentView.swift
//  FaceFacts
//
//  Created by Or Israeli on 16/01/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
	@Environment(\.modelContext) var modelContext
	@State private var path = [Person]()
	
	@State private var searchTerm = ""
	
	var body: some View {
		NavigationStack(path: $path) {
			PeopleView(searchString: searchTerm)
				.navigationTitle("FaceFacts")
				.navigationDestination(for: Person.self) { person in
					EditPersonView(person: person)
				}
				.toolbar {
					Button("Add Person", systemImage: "plus", action: addPerson)
				}
				.searchable(text: $searchTerm)
		}
	}
	
	func addPerson() {
		let person = Person(name: "", emailAddress: "", details: "")
		modelContext.insert(person)
		path.append(person)
	}
}

#Preview {
	ContentView()
}
