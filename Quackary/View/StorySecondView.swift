//
//  StorySecondView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 24/06/24.
//

import SwiftUI

struct StorySecondView: View {
    var body: some View {
        ZStack {
            LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Story 2", withExtension: "mp4")!)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("Story 2 Text")
                    .onTapGesture {
                        Router.shared.path.append(.OnBoarding)
                    }
            }
        }
    }
}

#Preview {
    StorySecondView()
}
