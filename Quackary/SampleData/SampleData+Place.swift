//
//  SwiftData+Place.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import Foundation
import SwiftData

extension Place {
    static let examplePlace1 = Place(name: "Restoran 1", lat: 0.0645454, long: -94.065454, priceRange: 1, openingHour: "06:00AM", closingHour: "07.00PM", imageNames: ["photo1", "photo2", "photo3"], foods: [.Beef])
    static let examplePlace2 = Place(name: "Restoran 2", lat: -0.0645454, long: -97.065454, priceRange: 2, openingHour: "06:00AM", closingHour: "07.00PM", imageNames: ["photo1", "photo2", "photo3"], foods: [.Beef])

    static func insertSampleData(modelContext: ModelContext) {
        modelContext.insert(examplePlace1)
        modelContext.insert(examplePlace2)
        modelContext.insert(Place(name: "Restoran 3", lat: -0.0645454, long: -97.065454, priceRange: 2, openingHour: "06:00AM", closingHour: "07.00PM", imageNames: ["Image URL 1", "Image URL 2"], foods: [.Beef]))
        modelContext.insert(Place(name: "Restoran 4", lat: -0.0645454, long: -97.065454, priceRange: 2, openingHour: "06:00AM", closingHour: "07.00PM", imageNames: ["Image URL 1", "Image URL 2"], foods: [.Beef]))
        modelContext.insert(Place(name: "Restoran 5", lat: -0.0645454, long: -97.065454, priceRange: 2, openingHour: "06:00AM", closingHour: "07.00PM", imageNames: ["Image URL 1", "Image URL 2"], foods: [.Beef]))
    }

    static func reloadSampleData(modelContext: ModelContext) {
        do {
            try modelContext.delete(model: Place.self)
            insertSampleData(modelContext: modelContext)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
