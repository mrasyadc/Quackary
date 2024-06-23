//
//  SampleData+User.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import Foundation
import SwiftData

extension User {
    static func insertSampleData(modelContext: ModelContext) {
        modelContext.insert(User(name: "The Current only User", preferences: [.Beef, .Bento, .Cheese, .Chicken], restricts: [.Alcohol]))
    }

    static func reloadSampleData(modelContext: ModelContext) {
        do {
            try modelContext.delete(model: User.self)
            insertSampleData(modelContext: modelContext)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
