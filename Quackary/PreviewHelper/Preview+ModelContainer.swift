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
            User.self,
            GlobalState.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        Task { @MainActor in
            Achievement.reloadSampleData(modelContext: container.mainContext)
            User.reloadSampleData(modelContext: container.mainContext)
            Place.reloadSampleData(modelContext: container.mainContext)
            Mission.reloadSampleData(modelContext: container.mainContext)
            GlobalState.reloadSampleData(modelContext: container.mainContext)
        }
        return container
    }
}
