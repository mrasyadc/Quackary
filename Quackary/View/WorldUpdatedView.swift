//
//  WorldView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 24/06/24.
//

import AVFoundation
import SwiftUI

struct WorldUpdatedView: View {
    var body: some View {
        ZStack {
            LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Main Page Background", withExtension: "mp4")!)
                .edgesIgnoringSafeArea(.all)
            
            LottieView(name: "Yellow Duck Child.json", loopMode: .loop)
            
            MissionModalityView()
            
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    WorldUpdatedView()
}
