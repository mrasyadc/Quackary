//
//  AudioManager.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 19/06/24.
//

import AVFoundation

final class AudioManager {
    private var audioFileName: String
    private var audioFileType: String
    private var audioPlayer: AVAudioPlayer
    
    
    init?(audioFileName: String, fileType: String) {
        self.audioFileName = audioFileName
        self.audioFileType = fileType
        self.audioPlayer = AVAudioPlayer()
        }

    func playSound() {
        DispatchQueue.global().async {
            self._playSound(soundFileName: self.audioFileName, fileType: self.audioFileType)
        }
                    
    }
    
    func _playSound(soundFileName: String, fileType: String) {
        // Get the URL of the sound file
        if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: fileType) {
            do {
                // Initialize the audio player with the sound file URL
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                // Prepare the audio player for playback
                audioPlayer.prepareToPlay()
                // Play the sound
                audioPlayer.play()
            } catch {
                // Handle the error if the audio player could not be initialized
                print("Error: Could not initialize AVAudioPlayer - \(error.localizedDescription)")
            }
        } else {
            // Handle the error if the sound file could not be found
            print("Error: Sound file not found")
        }
    }
}
