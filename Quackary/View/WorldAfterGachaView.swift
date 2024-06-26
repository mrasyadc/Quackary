//
//  WorldViewAfterGacha.swift
//  Quackary
//
//  Created by Bunga Prameswari on 25/06/24.
//

import SwiftUI

struct WorldAfterGachaView: View {
    var body: some View {
        ZStack {
            LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Main Page Background", withExtension: "mp4")!)
                .edgesIgnoringSafeArea(.all)
            
            LottieView(name: "Yellow Egg.json", loopMode: .loop)
            
            MissionModalityView()
            
        }.navigationBarBackButtonHidden()
        
    }
}

#Preview {
    WorldAfterGachaView()
}
