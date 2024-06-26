//
//  Router.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path: [Destination] = []

    enum Destination: String, Hashable {

        case SplashScreen, Home, Story, SecondStory, OnBoarding, Missions, Gacha, CheckIn, GoodReward, BadReward, ShareImage, History, DetailPlace, World, CheckInCapturedPhoto, Achievement, Reward, WorldViewUpdated, RestrictFoodView, MissionModalityView, WorldAfterGacha, FavoriteFoodView, FinalOnboarding
    }

    static let shared: Router = .init()
}
