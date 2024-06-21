//
//  LooperVideoView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 21/06/24.
//

import SwiftUI

struct LooperVideoView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> LoopingVideoViewController {
        return LoopingVideoViewController()
    }

    func updateUIViewController(_ uiViewController: LoopingVideoViewController, context: Context) {
        // No update needed for this example
    }
}

#Preview {
    LooperVideoView()
}
