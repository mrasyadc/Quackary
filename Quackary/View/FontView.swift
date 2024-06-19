//
//  FontView.swift
//  Quackary
//
//  Created by Muhammad Rasyad Caesarardhi on 19/06/24.
//

import SwiftUI

struct FontView: View {
    var body: some View {
        Text("Shake me! Lato").font(.custom("Lato-Black", size: 24))
        Text("Shake me! Lato").font(.custom("Lato-Italic", size: 24))
        Text("Shake me! Lato").font(.custom("Lato-Regular", size: 24))
        Text("Shake me! Reguler")
    }
}

#Preview {
    FontView()
}
