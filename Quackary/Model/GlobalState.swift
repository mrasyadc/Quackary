//
//  GlobalState.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 26/06/24.
//

import Foundation
import SwiftData

@Model
final class GlobalState {
    var selectedMission: SelectedMission?

    init() {
        self.selectedMission = .Blue
    }
}

enum SelectedMission: Hashable, Codable, Equatable {
    case Blue, Yellow
}
