//
//  AchievementView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import SwiftUI

struct AchievementView: View {
    var AVM: () = AchievementViewModel().getAllAchievement()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AchievementView()
}
