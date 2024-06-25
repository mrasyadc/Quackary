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
                    .highPriorityGesture(
                        TapGesture()
                            .onEnded { _ in
                                Router.shared.path.append(.SecondStory)
                            }
                    )
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    StoryFirstView()
}
