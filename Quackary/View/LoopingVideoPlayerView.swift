//
//  LooperVideoView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import SwiftUI

struct LoopingVideoPlayerView: View {
    var videoURL: URL

    var body: some View {
        VideoPlayerContainerView(viewModel: VideoPlayerViewModel(url: videoURL))
            .edgesIgnoringSafeArea(.all)
    }
}
