//
//  VideoView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import AVFoundation
import SwiftData
import SwiftUI

struct GachaView: View {
    @State private var player: AVPlayer?
    @State private var secondPlayer: AVPlayer?
    @State private var isFirst = true
    @StateObject private var shakeViewModel = ShakeViewModel()
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack {
            if !isFirst {
                if let player = secondPlayer {
                    VideoPlayerView(player: player)
                        .ignoresSafeArea()
                }
            }
            if player != nil {
                Color.white
                    .ignoresSafeArea().opacity(isFirst ? 1.0 : 0.0).animation(.easeInOut(duration: 1.0), value: isFirst)
                LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Gacha Screen 1", withExtension: "mp4")!)
                    .edgesIgnoringSafeArea(.all)
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
//                Router.shared.path.append(.DetailPlace)
                Router.shared.path.append(.WorldAfterGacha)
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    GachaView()
}
