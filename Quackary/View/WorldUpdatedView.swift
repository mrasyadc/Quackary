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
            // pikirin statenya
            // jadi patternnya yaitu dari
            // "(warna)" "(state ducknya)"
            // ex: Blue Duck Teen

            // adain state color juga
            // Yellow -> Blue (saat ini ada dua state)

            // algoritma:
            // tiap dapet achievement "biasa"
            // arahin ke state selanjutnya
            // jd state udah ditentuin dari awal,
            // bisa pake array

            // tiap dapet achievement "surprise"
            // arahin ke item baru
            // state item juga udah ditentuin
            // bisa pake array

            // tiap dapet achievement
            // tanya achievement typenya apa -> biasa/surpise
            // tanya warna skrg apa && state skrg apa
            // arahin ke array selanjutnya

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
