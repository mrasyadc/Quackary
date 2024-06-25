//
//  LottieView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 24/06/24.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop

    class Coordinator: NSObject {
        var parent: LottieView
        var animationView: LottieAnimationView?

        init(parent: LottieView) {
            self.parent = parent
            super.init()
        }

        func playAnimation() {
            // Perform animation playback on a background thread
            DispatchQueue.global(qos: .userInitiated).async {
                // Ensure that the UI updates are performed on the main thread
                DispatchQueue.main.async {
                    self.animationView?.play()
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        context.coordinator.animationView = animationView

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.playAnimation()
    }
}

#Preview {
    LottieView(name: "Blue Duck Adult.json")
}
