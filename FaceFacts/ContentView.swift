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
	
	@State private var sortOrder = [SortDescriptor(\Person.name)]
	@State private var searchTerm = ""
	
	var body: some View {
		NavigationStack(path: $path) {
			PeopleView(searchString: searchTerm, sortOrder: sortOrder)
				.navigationTitle("FaceFacts")
				.navigationDestination(for: Person.self) { person in
					EditPersonView(person: person)
				}
				.toolbar {
					Menu("Sort", systemImage: "arrow.up.arrow.down") {
						Picker("Sort", selection: $sortOrder) {
							Text("Name (A-Z)")
								.tag([SortDescriptor(\Person.name)])
							
							Text("Name (Z-A)")
								.tag([SortDescriptor(\Person.name, order: .reverse)])
						}
					}
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
