//
//  WorldView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 24/06/24.
//

import AVFoundation
import SwiftData
import SwiftUI

struct WorldAfterGachaView: View {
    @Environment(\.modelContext) private var modelContext
    @State var viewModel = WorldViewModel()
    var body: some View {
        ZStack {
            LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Main Page Background", withExtension: "mp4")!)
                .edgesIgnoringSafeArea(.all)

            switch viewModel.users.first?.getYellowStatus() {
            case .None:
                Text("")
            case .Egg:
                LottieView(name: "Yellow Egg.json", loopMode: .loop)
            case .Baby:
                LottieView(name: "Yellow Duck Child.json", loopMode: .loop)
            case .Teen:
                LottieView(name: "Yellow Duck Teen.json", loopMode: .loop)
            case .Adult:
                LottieView(name: "Yellow Duck Adult.json", loopMode: .loop)
            case nil:
                Text("")
            }

            switch viewModel.users.first?.getBlueStatus() {
            case .None:
                Text("")
            case .Egg:
                LottieView(name: "Blue Egg.json", loopMode: .loop)
            case .Baby:
                LottieView(name: "Blue Duck Child.json", loopMode: .loop)
            case .Teen:
                LottieView(name: "Blue Duck Teen.json", loopMode: .loop)
            case .Adult:
                LottieView(name: "Blue Duck Adult.json", loopMode: .loop)
            case nil:
                Text("")
            }

            if viewModel.users.first?.getListItem().contains(.Ball) ?? false {
                LottieView(name: SurpriseItem.Ball.rawValue, loopMode: .loop)
            }

            if viewModel.users.first?.getListItem().contains(.Lighthouse) ?? false {
                LottieView(name: SurpriseItem.Lighthouse.rawValue, loopMode: .loop)
            }

            if viewModel.users.first?.getListItem().contains(.AirBaloon) ?? false {
                LottieView(name: SurpriseItem.AirBaloon.rawValue, loopMode: .loop)
            }

            if viewModel.users.first?.getListItem().contains(.Boat) ?? false {
                LottieView(name: SurpriseItem.Boat.rawValue, loopMode: .loop)
            }

            if viewModel.users.first?.getListItem().contains(.Hats) ?? false {
                LottieView(name: SurpriseItem.Hats.rawValue, loopMode: .loop)
            }

            if viewModel.users.first?.getListItem().contains(.Parasol) ?? false {
                LottieView(name: SurpriseItem.Parasol.rawValue, loopMode: .loop)
            }

            if viewModel.users.first?.getListItem().contains(.Tube) ?? false {
                LottieView(name: SurpriseItem.Tube.rawValue, loopMode: .loop)
            }

            MissionModalityView()

        }.navigationBarBackButtonHidden().onAppear {
            viewModel.modelContext = modelContext
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        WorldAfterGachaView()
    }
}
