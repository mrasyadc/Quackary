//
//  Users.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 19/06/24.
//

import Foundation
import SwiftData

@Model
final class Users {
    var userId: UUID
    var name: String
    var preferences: [PreferenceType]

    init(name: String, preferences: [PreferenceType]) {
        self.userId = NSUUID() as UUID
        self.name = name
        self.preferences = preferences
    }
}

enum PreferenceType {
    case a, b, c, d, e, f, g
}
