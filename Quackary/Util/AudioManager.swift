//
//  AudioManager.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 19/06/24.
//

import AVFoundation
import Foundation

class AudioManager: ObservableObject {
    static let shared = AudioManager() // Singleton instance
    private var audioPlayers: [AVAudioPlayer] = []
    
    private init() {} // Private initializer to enforce singleton
    
    func playAudio(named audioName: String, fileType: String = "mp3", loop: Bool = false) {
        guard let audioPath = Bundle.main.path(forResource: audioName, ofType: fileType) else {
            print("Audio file \(audioName).\(fileType) not found")
            return
        }
        let url = URL(fileURLWithPath: audioPath)
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.numberOfLoops = loop ? -1 : 0
            audioPlayer.play()
            audioPlayers.append(audioPlayer)
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func stopAllAudio() {
        for player in audioPlayers {
            player.stop()
        }
        audioPlayers.removeAll()
    }
}
