//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Or Israeli on 16/01/2024.
//

import SwiftUI

struct EditPersonView: View {
	@Bindable var person: Person
	
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
			
			Section("Notes") {
				TextField("Details about this person", text: $person.details, axis: .vertical)
			}
		}
		.navigationTitle("Edit Person")
		.navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditPersonView(person: Person(name: "Keanu Reeves", emailAddress: "kreeves@exmaple.com", details: "matrix"))
//}
