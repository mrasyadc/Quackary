//
//  WorldViewModel.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 26/06/24.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class WorldViewModel {
    var modelContext: ModelContext?
    var users: [User] = []
    var user: User?

    func fetchUser() {
        let descriptor = FetchDescriptor<User>()

        users = (try? modelContext?.fetch(descriptor)) ?? []

//        users.first?.addItemToAchievement(item: .Ball)
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
