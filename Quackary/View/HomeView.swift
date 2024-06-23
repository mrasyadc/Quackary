//
//  HomeView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Home", withExtension: "mp4")!)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer().frame(height: 50)
                Image("Title")
                Spacer()
            }
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 6) {
                    Text("Get Started").font(.custom("Lato-ExtraBold", size: 16)).foregroundStyle(.blueBlackNormal)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .frame(width: 356, alignment: .center)
                .background(.yellowNormal)
                .cornerRadius(12)
                Spacer().frame(height: 30)
            }.onTapGesture {
                Router.shared.path.append(.Story)
            }
        }
    }
}

#Preview {
    HomeView()
}
