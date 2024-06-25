//
//  PlaceViewModel.swift
//  Quackary
//
//  Created by Romi Fadhurohman Nabil on 25/06/24.
//

import Foundation

class PlaceViewModel: ObservableObject {
    private var place: Place
    
    init(place: Place) {
        self.place = place
    }
    
    var name: String {
        return place.name
    }
    
    var coordinates: (lat: Double, long: Double) {
        return (place.lat, place.long)
    }
    
    var priceRange: Int {
        return place.priceRange
    }
    
    var imageNames: [String] {
        return place.imageNames
    }
    
    var isFav: Bool {
        return place.isFav
    }
    
    var isRestrict: Bool {
        return place.isRestrict
    }
    
    func toggleFavorite() {
        place.isFav.toggle()
    }
    
    func toggleRestrict() {
        place.isRestrict.toggle()
    }
    
    func getStatus(for day: Int) -> String {
        if getIsOpen(for: day) {
            guard let closingHour = place.openingHours["close_\(day)"] else {
                return "Open Now"
            }
            return "Open Now - Closes at \(closingHour)"
        } else {
            return "Closed"
        }
    }
    
    private func getIsOpen(for day: Int) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        guard let openingHour = place.openingHours["open_\(day)"],
              let closingHour = place.openingHours["close_\(day)"]
        else {
            return false
        }

        if openingHour == "0:00" && closingHour == "0:00" {
            return true // Buka 24 jam
        }

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
    
    static func loadPlacesFromJSON() -> [PlaceViewModel]? {
        // Lokasi file JSON dalam bundle
        guard let fileURL = Bundle.main.url(forResource: "places_data", withExtension: "json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let jsonDecoder = JSONDecoder()
            let jsonPlaces = try jsonDecoder.decode([JSONPlace].self, from: data)
            
            var places: [PlaceViewModel] = []
            for jsonPlace in jsonPlaces {
                let openingHours = [
                    "open_0": jsonPlace.open_0,
                    "close_0": jsonPlace.close_0,
                    "open_1": jsonPlace.open_1,
                    "close_1": jsonPlace.close_1,
                    "open_2": jsonPlace.open_2,
                    "close_2": jsonPlace.close_2,
                    "open_3": jsonPlace.open_3,
                    "close_3": jsonPlace.close_3,
                    "open_4": jsonPlace.open_4,
                    "close_4": jsonPlace.close_4,
                    "open_5": jsonPlace.open_5,
                    "close_5": jsonPlace.close_5,
                    "open_6": jsonPlace.open_6,
                    "close_6": jsonPlace.close_6
                ]
                
                let place = Place(
                    name: jsonPlace.name,
                    lat: jsonPlace.latitude,
                    long: jsonPlace.longitude,
                    priceRange: jsonPlace.priceLevel,
                    openingHours: openingHours,
                    imageNames: jsonPlace.images
                )
                places.append(PlaceViewModel(place: place))
            }
            
            return places
        } catch {
            print("Error loading JSON: \(error)")
            return nil
        }
    }
}
