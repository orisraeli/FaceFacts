//
//  PeopleView.swift
//  FaceFacts
//
//  Created by Or Israeli on 17/01/2024.
//

import SwiftData
import SwiftUI

struct PeopleView: View {
	@Environment(\.modelContext) var modelContext
	@Query var people: [Person]

    var body: some View {
		List {
			ForEach(people) { person in
				NavigationLink(value: person) {
					Text(person.name)
				}
			}
			.onDelete(perform: deletePeople)
		}
    }
	
	init(searchString: String = "", sortOrder: [SortDescriptor<Person>] = []) {
		_people = Query(filter: #Predicate { person in
			if searchString.isEmpty {
				true
			} else {
				person.name.localizedStandardContains(searchString)
				|| person.emailAddress.localizedStandardContains(searchString)
				|| person.details.localizedStandardContains(searchString)
			}
		}, sort: sortOrder)
	}
	
	func deletePeople(at offsets: IndexSet) {
		for offset in offsets {
			let person = people[offset]
			modelContext.delete(person)
		}
	}
}

#Preview {
    PeopleView()
}
