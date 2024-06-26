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

    @State var viewModel = DetailPlaceViewModel()

    var body: some View {
        List(viewModel.places) { place in
            Text(place.name)
        }.onAppear {
            viewModel.modelContext = modelContext
            viewModel.fetchPlaces()
        }
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        AchievementView()
    }
}
