//
//  VideoView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import AVFoundation
import SwiftData
import SwiftUI

let missionId = Mission.missionSample.missionId
struct GachaView: View {
//    var missionId = UUID
    @State private var player: AVPlayer?
    @State private var secondPlayer: AVPlayer?
    @State private var isFirst = true
    @StateObject private var shakeViewModel = ShakeViewModel()
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Mission> { $0.missionId == missionId
    }) var missions: [Mission]
    
    var body: some View {
//        var _ = print(missions[0].isPlaceHidden)
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
                missions[0].setMissionStateAfterGacha()
                missions[0].setMissionFinished()

                print("==missionIsdone==")
                print(missions[0].isDone)
                print("==isPlaceHidden==")
                print(missions[0].isPlaceHidden)
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    GachaView()
}
