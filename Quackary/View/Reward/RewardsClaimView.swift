//
//  RewardsClaimView.swift
//  Quackary
//
//  Created by Risa on 24/06/24.
//

import SwiftData
import SwiftUI

struct RewardsClaimView: View {
    @Environment(\.modelContext) private var modelContext
    @State var viewModel = RewardViewModel()

    var body: some View {
        ZStack {
            if viewModel.getSelectedMission() == .Yellow {
                Image("rewardsClaim-NC")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 8) {
                    Spacer().frame(height: 100)
                    HStack(alignment: .center, spacing: 0) {
                        Text("🍝 Issa Pasta Party!").font(.custom("Lato-Regular", size: 11)).foregroundStyle(.blueNormal)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color(red: 1, green: 0.98, blue: 0.94))
                    .cornerRadius(12)

                    Text("Check In Success!").font(.custom("Lato-ExtraBold", size: 28)).foregroundStyle(.blueDarker)
                    Text("You’ve earned a unique item to complete your island").font(.custom("Lato-Regular", size: 16))
                        .multilineTextAlignment(.center)
                        .frame(width: 214, alignment: .center).foregroundStyle(.blueDarker)
                    Image("Reward Umbrella")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 284, height: 284, alignment: .center)
                    Spacer()
                }
                .padding(0)
            } else {
                Image("Rewards Blue")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 8) {
                    Spacer().frame(height: 100)
                    HStack(alignment: .center, spacing: 0) {
                        Text("🍖 Meat Your Match").font(.custom("Lato-Regular", size: 11)).foregroundStyle(.blueNormal)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color(red: 1, green: 0.98, blue: 0.94))
                    .cornerRadius(12)

                    Text("Check In Success!").font(.custom("Lato-ExtraBold", size: 28)).foregroundStyle(.blueDarker)
                    Text("Your quack just leveled up! Now it can explore more, eat more, and grow bigger!").font(.custom("Lato-Regular", size: 16))
                        .multilineTextAlignment(.center)
                        .frame(width: 214, alignment: .center).foregroundStyle(.blueDarker)
                    Image("Reward Egg Upgrade")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 284, height: 284, alignment: .center)
                    Spacer()
                }
                .padding(0)
            }

            VStack {
                Spacer()
                if viewModel.getSelectedMission() == .Yellow {
                    HStack(alignment: .center, spacing: 6) {
                        Text("Claim Reward").font(.custom("Lato-ExtraBold", size: 16)).foregroundStyle(.blueBlackNormal)
                    }
                    .padding(.horizontal, 18)
                    .padding(.vertical, 12)
                    .frame(width: 356, alignment: .center)
                    .background(.yellowNormal)
                    .cornerRadius(12)
                } else {
                    HStack(alignment: .center, spacing: 6) {
                        Text("Claim Reward").font(.custom("Lato-ExtraBold", size: 16)).foregroundStyle(.white)
                    }
                    .padding(.horizontal, 18)
                    .padding(.vertical, 12)
                    .frame(width: 356, alignment: .center)
                    .background(.blueNormal)
                    .cornerRadius(12)
                }

                Spacer().frame(height: 30)
            }.highPriorityGesture(
                TapGesture()
                    .onEnded { _ in
                        Router.shared.path.append(.WorldAfterGacha)
                    }
            )
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        RewardsClaimView()
    }
}
