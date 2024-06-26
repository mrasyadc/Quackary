//
//  WorldView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 24/06/24.
//

import AVFoundation
import SwiftUI

struct WorldUpdatedView: View {
    @State private var scale: CGFloat = 0.8
    var body: some View {
        ZStack {
            LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Main Page Background", withExtension: "mp4")!)
                .edgesIgnoringSafeArea(.all)
            
            LottieView(name: "Yellow Duck Child.json", loopMode: .loop)
//
//            LottieView(name: "Blue Duck Child.json", loopMode: .loop)
//
            LottieView(name: "Tube.json", loopMode: .loop)

            ZStack {
                VStack {
                    Spacer()
                    Image("ExploreAndEarn")
                }
                VStack {
                    Spacer()
                    Button(action: { Router.shared.path.append(.Gacha) }) {
                        Text("Reveal My Destination")
                            .frame(maxWidth: 315)
                            .font(
                                Font.custom("Lato", size: 16)
                                    .weight(.heavy)
                            )
                            .foregroundColor(Color(red: 0.04, green: 0.09, blue: 0.16))
                            .padding(.horizontal, 18)
                            .padding(.vertical, 12)
                            .background(Color(red: 1, green: 0.75, blue: 0.41))
                            .cornerRadius(12)
                    }
                    Spacer().frame(height: 30)
                }

            }.ignoresSafeArea()

        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    WorldUpdatedView()
}
