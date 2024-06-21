//
//  Missions.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import Foundation
import SwiftData

final class Missions {
    private var missions: [UUID: Mission] = [:]

    func addMission(name: String, type: MissionType, place: Place? = nil, isHidden: Bool = true) {
        let mission = Mission(name: name, type: type, place: place, isHidden: isHidden)
        missions[mission.missionId] = mission
    }

    func getAllMissions() -> [Mission] {
        return Array(missions.values)
    }

    func getFinishedMissions() -> [Mission] {
        return missions.values.filter { $0.isDone }
    }

    func getUnfinishedMissions() -> [Mission] {
        return missions.values.filter { !$0.isDone }
    }

    func findMission(by id: UUID) -> Mission? {
        return missions[id]
    }

    func getSurpriseMission() -> Mission? {
        let hiddenMissions = missions.values.filter { $0.isMissionHidden }
        return hiddenMissions.randomElement()
    }

    func getPreferredMission(preferences: Set<PreferenceType>) -> Mission? {
        return missions.values.first { mission in
            guard let place = mission.place else { return false }
            return !place.foods.isDisjoint(with: preferences)
        }
    }
}

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
