//
//  QuackaryApp.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 12/06/24.
//

import SwiftData
import SwiftUI

@main
@MainActor
struct QuackaryApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Achievement.self,
            Mission.self,
            Place.self,
            User.self
        ])

        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let theContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])

            var itemFetchDescriptor = FetchDescriptor<Place>()
            itemFetchDescriptor.fetchLimit = 1

            var numOfPlace = try theContainer.mainContext.fetch(itemFetchDescriptor).count

            if numOfPlace > 9 { // magic number 9
                Achievement.reloadSampleData(modelContext: theContainer.mainContext)
                User.reloadSampleData(modelContext: theContainer.mainContext)
                Place.reloadSampleData(modelContext: theContainer.mainContext)
                Mission.reloadSampleData(modelContext: theContainer.mainContext)
            }

            guard try theContainer.mainContext.fetch(itemFetchDescriptor).count == 0 else { return theContainer }

            // This code will only run if the persistent store is empty.
            Achievement.insertSampleData(modelContext: theContainer.mainContext)
            User.insertSampleData(modelContext: theContainer.mainContext)
            Place.insertSampleData(modelContext: theContainer.mainContext)
            Mission.insertSampleData(modelContext: theContainer.mainContext)

            return theContainer
        } catch {
            fatalError("Failed to create container")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(sharedModelContainer)
    }
}
