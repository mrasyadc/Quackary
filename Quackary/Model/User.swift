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
    private var preferences: [PreferenceType]
    private var surprises: [PreferenceType]
    private var restrict: [PreferenceType]

    init(name: String, preferences: [PreferenceType], restrict: [PreferenceType]) {
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

    private func setSurprises(newPreferences: [PreferenceType]) {}

    private func setRestricts(newRestricts: [RestrictType]) {}

    func setUserPreferences(newPreferences: [PreferenceType], newRestricts: [RestrictType]) {
        setSurprises(newPreferences: newPreferences)
        setRestricts(newRestricts: newRestricts)
    }
}

enum PreferenceType {
    case Beef, Bento, Cheese, Chicken, Duck, Egg, Fish, FriesFood, Fruit, Lamb, Martabak, Meatball, Milk, Pasta, Pizza, PlantBased, Pork, Porridge, Ramen, Rea, Salad, Sandiwch, Satay, Soup, Steak, Sushi, Tempeh, Tofu, Vegetable, Yogurt
}

enum RestrictType {
    case Alcohol, TreeNuts, Beef, Wheat, Shrimp, Fish, Gluten, Pork, Seafood, Milk, Soy, Peanuts, Eggs, Dairy, Sesame, Shellfish
}
