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
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
            
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
                
                // BUTTON CHECK IN
                
                Button(action: { Router.shared.path.append(.Reward) }) {
                    Text("Check In")
                        .frame(maxWidth: .infinity)
                        .font(
                            Font.custom("Lato", size: 16)
                                .weight(.heavy)
                        )
                        .foregroundColor(Color(red: 0.04, green: 0.09, blue: 0.16))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(Color(red: 1, green: 0.75, blue: 0.41))
                        .cornerRadius(12)
                } // BUTTON CHECK IN
                .padding(.top).padding(.top).padding(.top).padding(.top).padding(.top).padding(.top)
                
                // blm kelar ya temen2
            }
            .padding(.horizontal, 20)
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    CheckInCapturedPhotoView()
}
