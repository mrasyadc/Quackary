//
//  Places.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import Foundation
import SwiftData

@Model
final class Places {
    var placeId: UUID
    var name: String
    var lat: Float64
    var long: Float64
    var priceRange: Int
    var openingHour: String
    var closingHour: String
    var imageNames: [String]

    init(name: String, lat: Float64, long: Float64, priceRange: Int, openingHour: String, closingHour: String, imageNames: [String]) {
        self.placeId = NSUUID() as UUID
        self.name = name
        self.lat = lat
        self.long = long
        self.priceRange = priceRange
        self.openingHour = openingHour
        self.closingHour = closingHour
        self.imageNames = imageNames
    }
}
