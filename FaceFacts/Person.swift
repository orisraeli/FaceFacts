//
//  Person.swift
//  FaceFacts
//
//  Created by Or Israeli on 16/01/2024.
//

import Foundation
import SwiftData

@Model
class Person {
	var name: String
	var emailAddress: String
	var details: String
	var metAt: Event?
	
	init(name: String, emailAddress: String, details: String, metAt: Event? = nil) {
		self.name = name
		self.emailAddress = emailAddress
		self.details = details
		self.metAt = metAt
	}
}
