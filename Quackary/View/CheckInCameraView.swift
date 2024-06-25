//
//  CheckInView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 24/06/24.
//

import SwiftUI

struct CheckInCameraView: View {
    var body: some View {
        ZStack {
            Color(.blueBlackNormal)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
            
            // blm kelar ya temen2
            
            VStack {
                ZStack {
                    HStack {
                        Image("ChevronDownIcon")
                        Spacer()
                    }
                    Text("Capture your Experience").font(.custom("Lato-ExtraBold", size: 22))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 58)
                
                CameraView()
                    .frame(width: 353, height: 416)
                    .cornerRadius(20)
                    .padding(.bottom, 58)
                
                ZStack {
                    Ellipse()
                        .foregroundColor(.clear)
                        .frame(width: 85, height: 85)
                        .overlay(Ellipse()
                            .inset(by: 2)
                            .stroke(.white, lineWidth: 3.5))
                        .offset(x: 0, y: 0)
                    
                    Ellipse()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .offset(x: 0, y: 0)
                }
                .frame(width: 80, height: 80)
                .highPriorityGesture(
                    TapGesture()
                        .onEnded { _ in
                            Router.shared.path.append(.CheckInCapturedPhoto)
                        }
                )
            }
            .padding(.horizontal, 20)
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    CheckInCameraView()
}
