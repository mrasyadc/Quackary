//
//  Places.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import Foundation
import SwiftData

final class Places {
    private var places: [UUID: Place] = [:]
    init(places: [UUID: Place]) {
        self.places = places
    }

    func addPlace(name: String, lat: Float64, long: Float64, priceRange: Int, openingHour: String, closingHour: String, imageNames: [String], foods: Set<PreferenceType>) {
        let place = Place(name: name, lat: lat, long: long, priceRange: priceRange, openingHour: openingHour, closingHour: closingHour, imageNames: imageNames, foods: foods)
        places[place.placeId] = place
    }

    func getAllPlaces() -> [Place] {
        return Array(places.values)
    }

    func getFavoritePlaces() -> [Place] {
        return places.values.filter { $0.isFav }
    }

    func getRestrictedPlaces() -> [Place] {
        return places.values.filter { $0.isRestrict }
    }

    func getOpenPlaces() -> [Place] {
        return places.values.filter { $0.getIsOpen() }
    }

    func setPlaceToFav(placeId: UUID) {
        places[placeId]?.setPlaceToFav()
    }

    func setPlaceToRestrict(placeId: UUID) {
        places[placeId]?.setPlaceToRestrict()
    }

    func findPlace(by id: UUID) -> Place? {
        return places[id]
    }
}
