//
//  User.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 19/06/24.
//

import Foundation
import SwiftData

@Model
final class User {
    var userId: UUID
    var name: String
    private var preferences: [FoodType]
    private var surprises: [FoodType]
    private var restrict: [FoodType]

    init(name: String, preferences: [FoodType], restrict: [FoodType]) {
        self.userId = NSUUID() as UUID
        self.name = name
        self.preferences = preferences
        self.restrict = restrict

        // surprises itu UNION Preferences - UNION restrict
        // TODO: Lanjutkan self.surprises
        // self.surprises =
    }
    
    func getUserPreferences() {}
    
    func getUserSurprises() {}
    
    func getUserRestricts() {}
    
    private func setSurprises(newPreferences: [FoodType]) {}
    
    private func setRestricts(newPreferences: [FoodType]) {}
    
    func setUserPreferences(newPreferences: [FoodType]) {
        setSurprises(newPreferences: newPreferences)
        setRestricts(newPreferences: newPreferences)
    }
}

enum FoodType {
    case a, b, c, d, e, f, g
}
