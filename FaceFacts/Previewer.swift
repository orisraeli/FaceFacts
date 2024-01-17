//
//  Previewer.swift
//  FaceFacts
//
//  Created by Or Israeli on 17/01/2024.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
	let container: ModelContainer
	let event: Event
	let person: Person
	
	init() throws {
		let config = ModelConfiguration(isStoredInMemoryOnly: true)
		container = try ModelContainer(for: Person.self, configurations: config)
		
		event = Event(name: "E3", location: "Los Angeles, USA")
		person = Person(name: "Keanu Reeves", emailAddress: "kreeves@matrix.com", details: "We need guns. Lots of guns.", metAt: event)
		
		container.mainContext.insert(person)
	}
}
