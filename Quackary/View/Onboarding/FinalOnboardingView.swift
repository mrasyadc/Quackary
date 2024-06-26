//
//  FinalOnboardingView.swift
//  Quackary
//
//  Created by Risa on 25/06/24.
//

import SwiftUI

struct FinalOnboardingView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                LottieView(name: "Final OnBoarding.json", loopMode: .loop).frame(width: 280)
                Spacer().frame(height: 160)
            }
            .padding(0)
            
            VStack {
                Spacer().frame(height: 160)
                Text("Together, we'll explore a mysterious island, uncover hidden culinary treasures, and build a vibrant experience.").font(.custom("Lato-Regular", size: 16))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .frame(width: 393).foregroundStyle(.white)
            }
            
            VStack {
                Spacer()
                Text("Let's create this exciting new world together!").font(.custom("Lato-ExtraBold", size: 16))
                    .foregroundStyle(.white)
                HStack(alignment: .center, spacing: 6) {
                    Text("Start Exploring").font(.custom("Lato-ExtraBold", size: 16)).foregroundStyle(.blueBlackNormal)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .frame(width: 356, alignment: .center)
                .background(.yellowNormal)
                .cornerRadius(12)
                Spacer().frame(height: 30)
            }.highPriorityGesture(
                TapGesture()
                    .onEnded { _ in
                        Router.shared.path.append(.World)
                    }
            )
        }
        .background(Color(red: 0.27, green: 0.48, blue: 0.62))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FinalOnboardingView()
}
