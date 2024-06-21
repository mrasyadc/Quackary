//
//  VideoPlayerUIView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import AVFoundation
import SwiftUI

class VideoPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    var player: AVPlayer? {
        didSet {
            playerLayer.player = player
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPlayerLayer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPlayerLayer()
    }

    private func setupPlayerLayer() {
        layer.addSublayer(playerLayer)
        playerLayer.videoGravity = .resizeAspectFill
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

#Preview {
    VideoPlayerUIView()
}
