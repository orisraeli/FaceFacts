//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by Or Israeli on 16/01/2024.
//

import SwiftData
import SwiftUI

@main
struct FaceFactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(for: Person.self)
    }
}
