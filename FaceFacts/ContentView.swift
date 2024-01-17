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
	@Query var people: [Person]
	
    var body: some View {
		NavigationStack(path: $path) {
			List {
				ForEach(people) { person in
					NavigationLink(value: person) {
						Text(person.name)
					}
				}
				.onDelete(perform: deletePeople)
			}
			.navigationTitle("FaceFacts")
			.navigationDestination(for: Person.self) { person in
				EditPersonView(person: person)
			}
			.toolbar {
				Button("Add Person", systemImage: "plus", action: addPerson)
			}
		}
    }
	
	func addPerson() {
		let person = Person(name: "", emailAddress: "", details: "")
		modelContext.insert(person)
		path.append(person)
	}
	
	func deletePeople(at offsets: IndexSet) {
		for offset in offsets {
			let person = people[offset]
			modelContext.delete(person)
		}
	}
}

#Preview {
    ContentView()
}
