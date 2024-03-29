//
//  EditEventView.swift
//  FaceFacts
//
//  Created by Or Israeli on 17/01/2024.
//

import SwiftUI

struct EditEventView: View {
	@Bindable var event: Event
    
	var body: some View {
		Form {
			TextField("Name", text: $event.name)
			TextField("Location", text: $event.location)
		}
		.navigationTitle("Edit Event")
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
	do {
		let previewer = try Previewer()
		
		return EditEventView(event: previewer.event)
			.modelContainer(previewer.container)
	} catch {
		return Text("Failed to create preview: \(error.localizedDescription)")
	}
}
