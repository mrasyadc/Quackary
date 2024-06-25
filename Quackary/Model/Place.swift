import Foundation

struct Place: Codable {
    var placeId: UUID
    var name: String
    var lat: Double
    var long: Double
    var priceRange: Int
    var openingHours: [String: String]  // Menyimpan jam buka dan tutup per hari
    var imageNames: [String]
    var isFav: Bool
    var isRestrict: Bool
    
    init(name: String, lat: Double, long: Double, priceRange: Int, openingHours: [String: String], imageNames: [String]) {
        self.placeId = UUID()
        self.name = name
        self.lat = lat
        self.long = long
        self.priceRange = priceRange
        self.openingHours = openingHours
        self.imageNames = imageNames
        self.isFav = false
        self.isRestrict = false
    }
}

struct JSONPlace: Codable {
    let keyword: String
    let name: String
    let placeID: String
    let latitude: Double
    let longitude: Double
    let priceLevel: Int
    let open_0: String
    let close_0: String
    let open_1: String
    let close_1: String
    let open_2: String
    let close_2: String
    let open_3: String
    let close_3: String
    let open_4: String
    let close_4: String
    let open_5: String
    let close_5: String
    let open_6: String
    let close_6: String
    let images: [String]
}
