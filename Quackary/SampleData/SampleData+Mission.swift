//
//  SampleData+Mission.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import Foundation
import SwiftData

extension Mission {
    static func insertSampleData(modelContext: ModelContext) {
        modelContext.insert(Mission(name: "Mission 1", type: .Regular, place: Place.examplePlace1, isHidden: true, rewardImageName: "Reward Image URL"))
        modelContext.insert(Mission(name: "Mission 2", type: .LimitedTime, place: Place.examplePlace1, isHidden: true, rewardImageName: "Reward Image URL"))
        modelContext.insert(Mission(name: "Mission 3", type: .Regular, place: Place.examplePlace1, isHidden: true, rewardImageName: "Reward Image URL"))
        modelContext.insert(Mission(name: "Mission 4", type: .Regular, place: Place.examplePlace1, isHidden: true, rewardImageName: "Reward Image URL"))
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
