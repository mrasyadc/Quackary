//
//  DetailPlaceViewModel.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 26/06/24.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class DetailPlaceViewModel {
    var modelContext: ModelContext?
    var places: [Place] = []

    func fetchPlaces() {
        let descriptor = FetchDescriptor<Place>(sortBy: [SortDescriptor(\.name)])

        places = (try? modelContext?.fetch(descriptor)) ?? []
    }
}
