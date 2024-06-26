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
                    .highPriorityGesture(
                        TapGesture()
                            .onEnded { _ in
                                Router.shared.path.append(.RestrictFoodView)
                            }
                    )
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    StorySecondView()
}
