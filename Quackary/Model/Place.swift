//
//  Places.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import Foundation
import SwiftData

@Model
final class Place {
    var placeId: UUID
    var name: String
    var lat: Float64
    var long: Float64
    var priceRange: Int
    var openingHour: String
    var closingHour: String
    var imageNames: [String]
    var foods: Set<PreferenceType>
    var isFav: Bool
    var isRestrict: Bool

    init(name: String, lat: Float64, long: Float64, priceRange: Int, openingHour: String, closingHour: String, imageNames: [String], foods: Set<PreferenceType>) {
        self.placeId = UUID()
        self.name = name
        self.lat = lat
        self.long = long
        self.priceRange = priceRange
        self.openingHour = openingHour
        self.closingHour = closingHour
        self.imageNames = imageNames
        self.foods = foods
        self.isFav = false
        self.isRestrict = false
    }

    func getIsOpen() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        guard let openingTime = dateFormatter.date(from: openingHour),
              let closingTime = dateFormatter.date(from: closingHour)
        else {
            return false
        }

        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: now)
        guard let currentTime = calendar.date(from: components) else {
            return false
        }

        if closingTime <= openingTime {
            return currentTime >= openingTime || currentTime <= closingTime
        } else {
            return currentTime >= openingTime && currentTime <= closingTime
        }
    }

    func setPlaceToFav() {
        isFav = true
    }

    func setPlaceToRestrict() {
        isRestrict = true
    }
}
