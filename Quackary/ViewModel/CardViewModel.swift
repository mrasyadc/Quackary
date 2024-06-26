//
//  BlueCardViewModel.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 26/06/24.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class CardViewModel {
    var modelContext: ModelContext?
    var users: [User] = []
    var user: User?
    var globalStates: [GlobalState] = []

    func fetchUser() {
        let descriptor = FetchDescriptor<User>()

        users = (try? modelContext?.fetch(descriptor)) ?? []

//        users.first?.addItemToAchievement(item: .Ball)
    }

    func fetchGlobalState() {
        let descriptor = FetchDescriptor<GlobalState>()

        globalStates = (try? modelContext?.fetch(descriptor)) ?? []
    }

    func setYellowMission() {
        globalStates.first?.selectedMission = .Yellow
    }

    func setBlueMission() {
        globalStates.first?.selectedMission = .Blue
    }

    func addItem(item: SurpriseItem) {
        users.first?.addItemToAchievement(item: item)
    }

    func upgradeYellow() {
        users.first?.upgradeYellow()
    }

    func upgradeBlue() {
        users.first?.upgradeBlue()
    }
}
