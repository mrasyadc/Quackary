/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 An extension that creates animal category instances for use as sample data.
 */

import Foundation
import SwiftData

extension Achievement {
    static let achievementOne = Achievement(name: "Nama Achievement", detail: "Detail Achievement", imageName: "URL Gambar Achievement")
    static let achievementTwo = Achievement(name: "Nama Achievement 2", detail: "Detail Achievement 2", imageName: "URL Gambar Achievement 2")
    static let achievementThree = Achievement(name: "Nama Achievement 2", detail: "Detail Achievement 2", imageName: "URL Gambar Achievement 2")

    static func insertSampleData(modelContext: ModelContext) {
        modelContext.insert(achievementOne)
        modelContext.insert(achievementTwo)
        modelContext.insert(achievementThree)

        modelContext.insert(Achievement(name: "Name Achievementnya apa ya", detail: "Detail achievement", imageName: "Image URL"))
        modelContext.insert(Achievement(name: "Name Achievementnya apa ya", detail: "Detail achievement", imageName: "Image URL"))
        modelContext.insert(Achievement(name: "Name Achievementnya apa ya", detail: "Detail achievement", imageName: "Image URL"))
        modelContext.insert(Achievement(name: "String", detail: "String", imageName: "String"))
        modelContext.insert(Achievement(name: "String", detail: "String", imageName: "String"))
        modelContext.insert(Achievement(name: "String", detail: "String", imageName: "String"))
        modelContext.insert(Achievement(name: "String", detail: "String", imageName: "String"))
        modelContext.insert(Achievement(name: "String", detail: "String", imageName: "String"))
        modelContext.insert(Achievement(name: "String", detail: "String", imageName: "String"))
    }

    static func reloadSampleData(modelContext: ModelContext) {
        do {
            try modelContext.delete(model: Achievement.self)
            insertSampleData(modelContext: modelContext)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
