//
//  WeekStarterModalityView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 25/06/24.
//

import SwiftUI

struct WeekStarterModalityView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("ExploreAndEarn")
            }
            VStack {
                Spacer()
                Button(action: { Router.shared.path.append(.Gacha) }) {
                    Text("Reveal My Destination")
                        .frame(maxWidth: 315)
                        .font(
                            Font.custom("Lato", size: 16)
                                .weight(.heavy)
                        )
                        .foregroundColor(Color(red: 0.04, green: 0.09, blue: 0.16))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(Color(red: 1, green: 0.75, blue: 0.41))
                        .cornerRadius(12)
                }
                Spacer().frame(height: 30)
            }

        }.ignoresSafeArea()
    }
}

#Preview {
    WeekStarterModalityView()
}
