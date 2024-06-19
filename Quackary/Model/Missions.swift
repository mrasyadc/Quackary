//
//  Missions.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import Foundation
import SwiftData

@Model
final class Missions {
    var missionId: UUID
    var name: String
    var placeId: UUID
    var type: MissionType
    var isHidden: Bool

    init(name: String, placeId: UUID, type: MissionType, isHidden: Bool) {
        self.missionId = NSUUID() as UUID
        self.name = name
        self.placeId = placeId
        self.type = type
        self.isHidden = isHidden
    }
}

enum MissionType {
    case a, b, c
}
