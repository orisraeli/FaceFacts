//
//  Event.swift
//  FaceFacts
//
//  Created by Or Israeli on 17/01/2024.
//

import Foundation
import SwiftData

@Model
class Event {
	var name: String
	var location: String
	var people = [Person]()
	
	init(name: String, location: String) {
		self.name = name
		self.location = location
	}
}
