//
//  LoopingVideoViewController.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import AVFoundation
import SwiftUI

class LoopingVideoViewController: UIViewController {
    var playerView: VideoPlayerUIView {
        return view as! VideoPlayerUIView
    }
    
    var player: AVPlayer? {
        get {
            return playerView.player
        }
        set {
            playerView.player = newValue
        }
    }
    
    override func loadView() {
        view = VideoPlayerUIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePlayer()
    }
    
    private func configurePlayer() {
        guard let path = Bundle.main.path(forResource: "Gacha Screen 1", ofType: "mp4") else { return }
        let url = URL(fileURLWithPath: path)
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
