//
//  HapticManager.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 19/06/24.
//

import CoreHaptics

class HapticUtils {
    static var engine: CHHapticEngine?
    static var hapticQueue = DispatchQueue(label: "HapticQueue")
    
    static func _runHaptic() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            //            print("Device does not support haptics")
            return
        }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
            
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 4)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 4)
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            
            try player?.start(atTime: CHHapticTimeImmediate)
        } catch {
            //            print("Error creating haptic engine: \(error)")
        }
    }
    
    static func runHaptic() {
        DispatchQueue.global().async {
            _runHaptic()
        }
    }
    
    static func runHapticThreeTimes() {
        DispatchQueue.global().async {
            _runHaptic()
            usleep(200000)
            _runHaptic()
            usleep(200000)
            _runHaptic()
        }
    }
}

//    static func runHapticOnMainThread() {
//        DispatchQueue.main.async {
//            runHaptic()
//        }
//    }
//
//    static func runHapticOnBackgroundThread() {
//        DispatchQueue.global().async {
//            runHaptic()
//        }
//    }
//
//    static func runHapticOnHitShark() {
//        DispatchQueue.global().async {
//            runHaptic()
//            usleep(200000) // Sleep for 0.5 seconds (500,000 microseconds)
//            runHaptic()
//        }
//    }
//
//    static func runHapticOnHitBomb() {
//        DispatchQueue.global().async {
//            runHaptic()
//            usleep(200000) // Sleep for 0.5 seconds (500,000 microseconds)
//            runHaptic()
//            usleep(200000)
//            runHaptic()
//        }
//    }
//
//    static func runHapticOnBackgroundThreadwithinSeconds() {
//        hapticQueue.async {
//            runHaptic()
//            usleep(500000) // Sleep for 0.5 seconds (500,000 microseconds)
//            runHaptic()
//            usleep(500000)
//            runHaptic()
//            usleep(500000)
//            runHaptic()
//        }
//    }
// }

// Example usage:
// Haptic.runHapticOnMainThread() // Dispatches the haptic function to the main thread
// Haptic.runHapticOnBackgroundThread() // Dispatches the haptic function to a background thread
