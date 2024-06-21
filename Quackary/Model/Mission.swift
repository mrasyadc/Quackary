//
//  Missions.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import Foundation
import SwiftData

@Model
final class Mission {
    var missionId: UUID
    var name: String
    var place: Place?
    var type: MissionType
    var isMissionHidden: Bool
    var isPlaceHidden: Bool
    var isDone: Bool
    var doneTimestamp: Date?
    var photoName: String?
    var writing: String?
    var rewardImageName: String
    var deadlineDate: Date?
    var rewardXPositionInScreen: Float?
    var rewardYPositionInScreen: Float?

    init(name: String, type: MissionType, place: Place? = nil, isHidden: Bool = true) {
        self.missionId = UUID()
        self.name = name
        self.place = place
        self.type = type
        self.isMissionHidden = isHidden
        self.isPlaceHidden = isHidden
        self.isDone = false
        self.doneTimestamp = nil
        self.photoName = nil
        self.writing = nil
        self.rewardImageName = "nil"
        self.deadlineDate = nil
        self.rewardXPositionInScreen = nil
        self.rewardYPositionInScreen = nil
    }

    func getPositionForNewReward() {
        let screenWidth: Float = 320.0
        let screenHeight: Float = 480.0

        rewardXPositionInScreen = Float.random(in: 0..<screenWidth)
        rewardYPositionInScreen = Float.random(in: 0..<screenHeight)
    }

    func setMissionFinished() {
        isDone = true
        doneTimestamp = Date()
        getPositionForNewReward()
    }
}

enum MissionType: Codable, Hashable, Equatable {
    case Regular, LimitedTime
}

//// Example usage:
// let placesManager = Places()
// placesManager.addPlace(name: "Cafe Delight", lat: 40.748817, long: -73.985428, priceRange: 2, openingHour: "08:00", closingHour: "22:00", imageNames: ["cafe1.png", "cafe2.png"], foods: [.Chicken, .Salad])
// let place = placesManager.getAllPlaces().first!
//
// let missionsManager = Missions()
// missionsManager.addMission(name: "Visit Cafe Delight", type: .Regular, place: place)
// missionsManager.addMission(name: "Find the Hidden Cafe", type: .LimitedTime)
//
// let allMissions = missionsManager.getAllMissions()
// let finishedMissions = missionsManager.getFinishedMissions()
// let unfinishedMissions = missionsManager.getUnfinishedMissions()
//
// if let surpriseMission = missionsManager.getSurpriseMission() {
//    print("Surprise mission: \(surpriseMission.name)")
// }
//
// let preferences: Set<PreferenceType> = [.Chicken, .Salad]
// if let preferredMission = missionsManager.getPreferredMission(preferences: preferences) {
//    print("Preferred mission: \(preferredMission.name)")
// }
