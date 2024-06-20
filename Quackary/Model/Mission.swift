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

    init(name: String, placeId: UUID, type: MissionType, isHidden: Bool, place: Place) {
        self.missionId = NSUUID() as UUID
        self.name = name
        self.place = place
        self.type = type
        self.isMissionHidden = true
        self.isPlaceHidden = true
        self.isDone = false
        self.doneTimestamp = nil
    }

    func getPositionForNewReward() {}

    func setMissionFinished(missionId: UUID) {}

    func getSurpriseMission() {}

    func getPreferredMission() {}
}

enum MissionType {
    case a, b, c
}
