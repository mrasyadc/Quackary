//
//  AchievementView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 20/06/24.
//

import SwiftData
import SwiftUI

struct AchievementView: View {
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \Achievement.achievementId) var achievement: [Achievement]

    var body: some View {
        Text(String(achievement.count))
        List(achievement) { achie in
            Text(achie.name)
            Text("Is Done: \(String(achie.isDone))")
        }
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        AchievementView()
    }
}
