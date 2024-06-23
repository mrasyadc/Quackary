/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 An extension that creates a sample model container to use when previewing
  views in Xcode.
 */

import SwiftData

extension ModelContainer {
    static var sample: () throws -> ModelContainer = {
        let schema = Schema([
            Achievement.self,
            Mission.self,
            Place.self,
            User.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        Task { @MainActor in
            Achievement.insertSampleData(modelContext: container.mainContext)
            User.insertSampleData(modelContext: container.mainContext)
            Place.insertSampleData(modelContext: container.mainContext)
            Mission.insertSampleData(modelContext: container.mainContext)
        }
        return container
    }
}
