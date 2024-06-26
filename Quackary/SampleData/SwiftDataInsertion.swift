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
        MainView().onAppear {
            Achievement.insertSampleData(modelContext: modelContext)
            User.insertSampleData(modelContext: modelContext)
            Place.insertSampleData(modelContext: modelContext)
            Mission.insertSampleData(modelContext: modelContext)
        }
    }
}
