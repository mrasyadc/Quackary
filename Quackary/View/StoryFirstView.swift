//
//  StoryView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import SwiftUI

struct StoryFirstView: View {
    var body: some View {
        ZStack {
            LoopingVideoPlayerView(videoURL: Bundle.main.url(forResource: "Story 1", withExtension: "mp4")!)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("Story 1 Text")
                    .onTapGesture {
                        Router.shared.path.append(.SecondStory)
                    }
            }
        }
    }
}

#Preview {
    StoryFirstView()
}
