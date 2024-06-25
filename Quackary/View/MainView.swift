//
//  MainView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import SwiftUI

struct MainView: View {
    @StateObject private var navPath = Router.shared

    var body: some View {
        NavigationStack(path: $navPath.path) {
            VStack {
                Button {
                    Router.shared.path.append(.Story)
                } label: {
                    Text("Go To Story")
                }
            }

            VStack {
                Button {
                    Router.shared.path.append(.SplashScreen)
                } label: {
                    Text("Go To Splash")
                }
            }
            VStack {
                Button {
                    Router.shared.path.append(.Home)
                } label: {
                    Text("Go To Home")
                }
            }
            VStack {
                Button {
                    Router.shared.path.append(.Gacha)
                } label: {
                    Text("Go To Gacha")
                }
            }
            VStack {
                Button {
                    Router.shared.path.append(.World)
                } label: {
                    Text("Go To World")
                }
            }
            VStack {
                Button {
                    Router.shared.path.append(.CheckIn)
                } label: {
                    Text("Go To Check In")
                }
            }
            VStack {
                Button {
                    Router.shared.path.append(.Achievement)
                } label: {
                    Text("Go To Achievement")
                }
            }

            .toolbar(.hidden)
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .Story:
                    StoryFirstView()
                case .SecondStory:
                    StorySecondView()
                case .Home:
                    HomeView()
                case .SplashScreen:
                    SplashScreenView()
                case .OnBoarding:
                    HomeView()
                case .Missions:
                    HomeView()
                case .Gacha:
                    GachaView()
                case .CheckIn:
                    CheckInCameraView()
                case .CheckInCapturedPhoto:
                    CheckInCapturedPhotoView()
                case .GoodReward:
                    HomeView()
                case .BadReward:
                    HomeView()
                case .ShareImage:
                    HomeView()
                case .History:
                    HomeView()
                case .DetailPlace:
                    DetailPlaceView()
                case .World:
                    WorldView()
                case .Achievement:
                    AchievementView()
                case .Reward:
                    RewardsClaimView()
                case .WorldViewUpdated:
                    WorldUpdatedView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
