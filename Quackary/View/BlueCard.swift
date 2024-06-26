//
//  BlueCard.swift
//  Quackary
//
//  Created by Bunga Prameswari on 25/06/24.
//

import SwiftUI

struct BlueCard: View {
    @State var imageName: String = "Card, C"
    @State var rewardImageName: String = "Reward Egg Upgrade" //ini gonta ganti sesuai reward
    
    var body: some View {
        CardView(imageName: $imageName, 
                 rewardImageName: $rewardImageName)
    }
}

#Preview {
    BlueCard()
}
