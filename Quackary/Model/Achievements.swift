//
//  Achievements.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import Foundation
import SwiftData

@Model
final class Achievements {
    var achievementId: UUID
    var name: String
    var detail: String
    var imageName: String

    init(name: String, detail: String, imageName: String) {
        self.achievementId = NSUUID() as UUID
        self.name = name
        self.detail = detail
        self.imageName = imageName
    }
}
