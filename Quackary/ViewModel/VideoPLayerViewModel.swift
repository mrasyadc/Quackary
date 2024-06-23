//
//  VideoPLayerViewModel.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import AVKit
import SwiftUI

class VideoPlayerViewModel: ObservableObject {
    @Published var player: AVPlayer?

    init(url: URL) {
        configurePlayer(with: url)
    }

    private func configurePlayer(with url: URL) {
        player = AVPlayer(url: url)
        player?.actionAtItemEnd = .none

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loopVideo),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player?.currentItem)

        player?.play()
    }

    @objc private func loopVideo() {
        player?.seek(to: .zero)
        player?.play()
    }
}
