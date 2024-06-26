//
//  SwiftDataInsertion.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 23/06/24.
//

import SwiftUI

struct SwiftDataInsertion: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        RouteView().task {
            Achievement.reloadSampleData(modelContext: modelContext)
            User.reloadSampleData(modelContext: modelContext)
            Place.reloadSampleData(modelContext: modelContext)
            Mission.reloadSampleData(modelContext: modelContext)
            GlobalState.reloadSampleData(modelContext: modelContext)
        }
    }
}

#Preview {
    SwiftDataInsertion()
}
