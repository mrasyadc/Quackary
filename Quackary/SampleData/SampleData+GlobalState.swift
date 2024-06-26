//
//  SampleData+GlobalState.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 26/06/24.
//

import Foundation
import SwiftData

extension GlobalState {
    static func insertSampleData(modelContext: ModelContext) {
        modelContext.insert(GlobalState())
    }

    static func reloadSampleData(modelContext: ModelContext) {
        do {
            try modelContext.delete(model: GlobalState.self)
            insertSampleData(modelContext: modelContext)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
