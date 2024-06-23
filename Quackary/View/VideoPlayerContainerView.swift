//
//  VideoPlayerContainerView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import SwiftUI

struct VideoPlayerContainerView: UIViewRepresentable {
    @ObservedObject var viewModel: VideoPlayerViewModel

    func makeUIView(context: Context) -> VideoPlayerUIView {
        let view = VideoPlayerUIView()
        return view
    }

    func updateUIView(_ uiView: VideoPlayerUIView, context: Context) {
        uiView.player = viewModel.player
    }
}
