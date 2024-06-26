//
//  YellowCard.swift
//  Quackary
//
//  Created by Bunga Prameswari on 25/06/24.
//

import SwiftUI

struct YellowCard: View {
    @State var imageName: String = "Card, NC"
    @State var rewardImageName: String = "Reward Umbrella" // ini gonta ganti sesuai reward

//    statenya
//    egg upgrade -> child upgrade -> teen upgrade -> adult upgrade -> egg plus
//    umbrella -> ball -> hat -> lifebuoy -> hotballoon -> mercusuar -> boat

    var body: some View {
        CardView(imageName: $imageName,
                 rewardImageName: $rewardImageName)
    }
}

#Preview {
    YellowCard()
}
