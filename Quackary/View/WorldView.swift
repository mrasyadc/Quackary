//
//  WorldView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 24/06/24.
//

import AVFoundation
import SwiftUI

struct WorldView: View {
    var body: some View {
        ZStack {
            LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Main Page Background", withExtension: "mp4")!)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("ExploreAndEarn")
                    .onTapGesture {
                        Router.shared.path.append(.Gacha)
                    }
            }
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

//            LottieView(name: "Yellow Duck Adult.json", loopMode: .loop)
//
//            LottieView(name: "Blue Duck Child.json", loopMode: .loop)
//
//            LottieView(name: "Tube.json", loopMode: .loop)
        }
    }
}

#Preview {
    WorldView()
}
