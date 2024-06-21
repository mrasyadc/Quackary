//
//  ShakeViewModel.swift
//  Quackary
//
//  Created by Romi Fadhurohman Nabil on 12/06/24.
//

import Combine
import Foundation
import SwiftUI

// ViewModel to handle shake detection logic
class ShakeViewModel: ObservableObject {
    @Published var shakeDetected: Bool = false
    private var cancellables = Set<AnyCancellable>()

    init() {
        NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)
            .sink { [weak self] _ in
                self?.shakeDetected = true
            }
            .store(in: &cancellables)
    }

    func resetShake() {
        shakeDetected = false
    }
}
