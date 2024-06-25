//
//  CheckInCapturedPhotoView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 24/06/24.
//

import SwiftUI

struct CheckInCapturedPhotoView: View {
    var body: some View {
        ZStack {
            Color(.blueBlackNormal)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                HStack {
                    Text("How was your experience?").font(.custom("Lato-ExtraBold", size: 22))
                        .foregroundStyle(.white)
                    Spacer()
                    Image("XIcon")
                }
                .padding(.bottom, 58)
                
                Image("photo1")
                    .resizable()
                    .frame(width: 353, height: 416)
                    .cornerRadius(20)
                    .padding(.bottom, 58)
                
                //blm kelar ya temen2
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    CheckInCapturedPhotoView()
}
