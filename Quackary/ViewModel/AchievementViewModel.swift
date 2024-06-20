//
//  AchievementViewModel.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import Foundation
import SwiftUI

class AchievementViewModel: ObservableObject {
    init() {}

    func getAllAchievement() {
        // Example usage:
        let achievementManager = Achievements()

        achievementManager.addAchievement(name: "First Steps", detail: "Complete the first task", imageName: "first_steps.png")
        achievementManager.addAchievement(name: "Master", detail: "Complete all tasks", imageName: "master.png")

        if let firstAchievement = achievementManager.findAchievement(by: UUID()) {
            achievementManager.setAchievementToFinish(achievementId: firstAchievement.achievementId)
        }

        // Get all finished achievements
        let finishedAchievements = achievementManager.getFinishedAchievements()
        print(finishedAchievements.map { $0.name }) // Output depends o
    }
}
