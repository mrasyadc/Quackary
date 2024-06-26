//
//  RewardViewModel.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 26/06/24.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class RewardViewModel {
    var modelContext: ModelContext?
    var users: [User] = []
    var globalStates: [GlobalState] = []

    func fetchGlobalState() {
        let descriptor = FetchDescriptor<GlobalState>()

        globalStates = (try? modelContext?.fetch(descriptor)) ?? []
    }

    func getSelectedMission() -> SelectedMission {
        return globalStates.first?.selectedMission ?? .Blue
    }
}
