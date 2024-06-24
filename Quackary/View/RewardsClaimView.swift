//
//  RewardsClaimView.swift
//  Quackary
//
//  Created by Risa on 24/06/24.
//

import SwiftUI

struct RewardsClaimView: View {
    var body: some View {
        ZStack {
            Image("rewardsClaim-NC")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 8) {
                Spacer().frame(height: 100)
                HStack(alignment: .center, spacing: 0) {
                    Text("🍝 Issa Pasta Party!").font(.custom("Lato-Regular", size: 11))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color(red: 1, green: 0.98, blue: 0.94))
                .cornerRadius(12)
                
                Text("Check In Success!").font(.custom("Lato-ExtraBold", size: 28))
                Text("You’ve earned a unique item to complete your island").font(.custom("Lato-Regular", size: 16))
                    .multilineTextAlignment(.center)
                    .frame(width: 214, alignment: .center)
                Image("rewardItem-Umbrella")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 284, height: 284, alignment: .center)
                Spacer()
            }
            .padding(0)
            
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 6) {
                    Text("Claim Reward").font(.custom("Lato-ExtraBold", size: 16)).foregroundStyle(.blueBlackNormal)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .frame(width: 356, alignment: .center)
                .background(.yellowNormal)
                .cornerRadius(12)
                Spacer().frame(height: 30)
            }.onTapGesture {
//                Router.shared.path.append(.Story)
            }
        }
    }
}

#Preview {
    RewardsClaimView()
}
