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
            SplashScreenView()

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

                    case .RestrictFoodView:
                        RestrictFoodView()

                    case .MissionModalityView:
                        MissionModalityView()
                    case .WorldAfterGacha:
                        WorldAfterGachaView()

                    }
                    
                }
        }
    }
}

#Preview {
    MainView()
}
