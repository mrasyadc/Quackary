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
    private var preferences: Set<PreferenceType> = []
    private var surprises: Set<PreferenceType> = []
    private var restricts: Set<RestrictType> = []
    private var yellowStatus: AchievementStatus?
    private var blueStatus: AchievementStatus?
    private var item: Set<SurpriseItem>? = []

    init(name: String, preferences: Set<PreferenceType>, restricts: Set<RestrictType>) {
        self.userId = NSUUID() as UUID
        self.name = name
        self.preferences = preferences
        self.restricts = restricts
        self.yellowStatus = .Egg
        self.blueStatus = .None
        self.item = []
        self.surprises = getSurpriseSetFromPreferenceSetSubstractRestrictSet(preferences, restricts)
        //        self.surprises = [.Beef]
        // surprises itu UNION Preferences - UNION restrict
        // TODO: Lanjutkan self.surprises
        // self.surprises =
    }

    func getBlueStatus() -> AchievementStatus {
        return blueStatus ?? .None
    }

    func getYellowStatus() -> AchievementStatus {
        return yellowStatus ?? .None
    }

    func getListItem() -> Set<SurpriseItem> {
        return item ?? []
    }

    func upgradeBlue() {
        switch blueStatus {
        case .None:
            blueStatus = .Egg
        case .Egg:
            blueStatus = .Baby
        case .Baby:
            blueStatus = .Teen
        case .Teen:
            blueStatus = .Adult
        case .Adult:
            blueStatus = .Adult
        case .none:
            blueStatus = .Egg
        }
    }

    func upgradeYellow() {
        switch yellowStatus {
        case .None:
            yellowStatus = .Egg
        case .Egg:
            yellowStatus = .Baby
        case .Baby:
            yellowStatus = .Teen
        case .Teen:
            yellowStatus = .Adult
        case .Adult:
            yellowStatus = .Adult
        case .none:
            yellowStatus = .Egg
        }
    }

    func addItemToAchievement(item: SurpriseItem) {
        self.item?.insert(item)
    }

    func getUserPreferences() -> Set<PreferenceType> {
        return preferences
    }

    func getUserSurprises() -> Set<PreferenceType> {
        return surprises
    }

    func getUserRestricts() -> Set<RestrictType> {
        return restricts
    }

    private func setSurprises(newPreferences: Set<PreferenceType>, newRestricts: Set<RestrictType>) {
//        KOK GABISA SELF.SURPRISE??!!! APA K
        surprises = getSurpriseSetFromPreferenceSetSubstractRestrictSet(newPreferences, newRestricts)
    }

    private func setRestricts(newRestricts: Set<RestrictType>) {
        restricts = newRestricts
    }

    private func setPreferences(newPreferences: Set<PreferenceType>) {
        preferences = newPreferences
    }

    func setUserPreferences(newPreferences: Set<PreferenceType>, newRestricts: Set<RestrictType>) {
        setPreferences(newPreferences: newPreferences)
        setSurprises(newPreferences: newPreferences, newRestricts: newRestricts)
        setRestricts(newRestricts: newRestricts)
    }

    private func getSurpriseSetFromPreferenceSetSubstractRestrictSet(_ PreferencesToSubstract: Set<PreferenceType>, _ RestrictForSubtractTo: Set<RestrictType>) -> Set<PreferenceType> {
        // Convert RestrictType set to PreferenceType set
        let mappedRestrictSet = Set(restricts.compactMap { mapToPreferenceType(restrict: $0) })

        // Perform the subtraction
        let resultSet = preferences.subtracting(mappedRestrictSet)

        return resultSet
    }

    private func mapToPreferenceType(restrict: RestrictType) -> PreferenceType? {
        switch restrict {
        case .Beef: return .Beef
        case .Fish: return .Fish
        case .Milk: return .Milk
        case .Pork: return .Pork
        // Add cases for other restrictions that map to preferences if needed
        default: return nil
        }
    }
}

// enum PreferenceType: Hashable, Codable, Equatable {
//    case Beef, Bento, Cheese, Chicken, Duck, Egg, Fish, FriesFood, Fruit, Lamb, Martabak, Meatball, Milk, Pasta, Pizza, PlantBased, Pork, Porridge, Ramen, Rea, Salad, Sandiwch, Satay, Soup, Steak, Sushi, Tempeh, Tofu, Vegetable, Yogurt
// }
//
// enum RestrictType: Hashable, Codable, Equatable {
//    case Alcohol, TreeNuts, Beef, Wheat, Shrimp, Fish, Gluten, Pork, Seafood, Milk, Soy, Peanuts, Eggs, Dairy, Sesame, Shellfish
// }

enum AchievementStatus: Hashable, Codable, Equatable {
    case None, Egg, Baby, Teen, Adult
}

enum SurpriseItem: String, CaseIterable, Hashable, Codable, Equatable {
    case Ball = "Ball.json"
    case Lighthouse = "Lighthouse.json"
    case AirBaloon = "Air Balloon.sjon"
    case Boat = "Boat.json"
    case Hats = "Hats.json"
    case Parasol = "Parasol.json"
    case Tube = "Tube.json"
}
