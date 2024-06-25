//
//  LottieView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 24/06/24.
//

import Foundation
import Lottie
import SwiftUI
import UIKit


//extension AnimationV


struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    var animationView = LottieAnimationView()

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {

        let view = UIView(frame: .zero)

        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(animationView)

        NSLayoutConstraint.activate([

            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),

            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}

}
#Preview {
    LottieView(name: "Blue Duck Adult.json")
}
