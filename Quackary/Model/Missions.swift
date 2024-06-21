//
//  Missions.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import Foundation

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
