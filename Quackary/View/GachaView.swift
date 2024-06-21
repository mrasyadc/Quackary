//
//  VideoView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import AVFoundation
import SwiftUI

struct GachaView: View {
    @State private var player: AVPlayer?
    @State private var secondPlayer: AVPlayer?
    @State private var isFirst = true
    @StateObject private var shakeViewModel = ShakeViewModel()

    var body: some View {
        ZStack {
            if !isFirst {
                if let player = secondPlayer {
                    VideoPlayerView(player: player)
                        .ignoresSafeArea()
                }
            }
            if let player = player {
                Color.white
                    .ignoresSafeArea().opacity(isFirst ? 1.0 : 0.0).animation(.easeInOut(duration: 1.0), value: isFirst)
                LooperVideoView()
                    .ignoresSafeArea().opacity(isFirst ? 1.0 : 0.0).animation(.easeInOut(duration: 0.5), value: isFirst)
            }
        }
        .onAppear {
            if let videoURL = Bundle.main.url(forResource: "Gacha Screen 1", withExtension: "mp4") {
                player = AVPlayer(url: videoURL)
                player?.play()
                player?.isMuted = true
            }
        }.onShake {
            HapticUtils.runHapticThreeTimes()
            isFirst = false
            if let videoURL = Bundle.main.url(forResource: "Gacha Screen Shake", withExtension: "mp4") {
                secondPlayer = AVPlayer(url: videoURL)
                secondPlayer?.play()
                secondPlayer?.isMuted = true
            }
        }
    }
}

#Preview {
    GachaView()
}
