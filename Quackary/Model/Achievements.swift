//
//  Achievements.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import Foundation
import SwiftData

@Model
final class Achievements {
    private var achievements: [UUID: Achievement] = [:]
    init(achievements: [UUID: Achievement]) {
        self.achievements = achievements
    }

    // Add a new achievement
    func addAchievement(name: String, detail: String, imageName: String) {
        let achievement = Achievement(name: name, detail: detail, imageName: imageName)
        achievements[achievement.achievementId] = achievement
    }

    // Get all finished achievements
    func getFinishedAchievements() -> [Achievement] {
        return achievements.values.filter { $0.isDone }
    }

    // Set a specific achievement to finished
    func setAchievementToFinish(achievementId: UUID) {
        if let achievement = achievements[achievementId] {
            achievement.isDone = true
            achievement.timestamp = Date()
        }
    }

    // Get all achievements
    func getAllAchievements() -> [Achievement] {
        return Array(achievements.values)
    }

    // Find an achievement by ID
    func findAchievement(by id: UUID) -> Achievement? {
        return achievements[id]
    }
}
