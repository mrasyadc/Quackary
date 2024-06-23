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
        case SplashScreen, Home, Story, OnBoarding, Missions, Gacha, CheckIn, GoodReward, BadReward, ShareImage, History, PlaceDetail
    }

    static let shared: Router = Router()
}
