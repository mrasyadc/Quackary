//
//  QuackaryApp.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 12/06/24.
//

import SwiftData
import SwiftUI

@main
struct QuackaryApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Achievement.self,
            Mission.self,
            Place.self,
            User.self,
            GlobalState.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SwiftDataInsertion()
        }
        .modelContainer(sharedModelContainer)
    }
}
