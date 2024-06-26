//
//  VideoPlayerView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import AVKit
import SwiftUI

struct VideoPlayerView: UIViewControllerRepresentable {
    var player: AVPlayer

    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = UIScreen.main.bounds
        controller.view.layer.addSublayer(playerLayer)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the player if needed
    }
}
