//
//  SplashScreenView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            // Background image
            Image("Splash Screen")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }.onTapGesture {
            Router.shared.path.append(.Home)
        }
    }
}

#Preview {
    SplashScreenView()
}
