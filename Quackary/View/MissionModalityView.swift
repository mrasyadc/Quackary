//
//  ModalityView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 25/06/24.
//

import SwiftUI

struct MissionModalityView: View {
    @State private var offset: CGFloat = 0
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            ModalityContent()
                .background(Color.white)
                .cornerRadius(32)
                .shadow(radius: 10)
                .offset(y: isExpanded ? 0 : 518)
                .animation(.spring())
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.offset = gesture.translation.height
                        }
                        .onEnded { gesture in
                            if gesture.translation.height > 50 {
                                withAnimation {
                                    self.isExpanded = false
                                }
                            } else if gesture.translation.height < -50 {
                                withAnimation {
                                    self.isExpanded = true
                                }
                            }
                            self.offset = 0
                        }
                )
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ModalityContent: View {
    var body: some View {
        ZStack {
            Image("Modality")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 15)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Places to visit this week")
                            .font(.custom("Lato-ExtraBold", size: 22))
                        Text("Explore, check in, and gain rewards!")
                            .font(.custom("Lato-Regular", size: 16))
                    }
                    .foregroundColor(.blueDark)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.redLightHover)
                            .frame(minWidth: 0, maxWidth: .infinity)
                        Text("6 days left")
                            .font(.custom("Lato-ExtraBold", size: 13))
                            .foregroundColor(.redNormal)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 2.5)
                    }
                    .fixedSize()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                VStack(alignment: .center, spacing: 12) {
                    ZStack(alignment: .leading) {
                        Image("SectionBlueBackground")
                        Text("Top treats for your taste")
                            .font(.custom("Lato-ExtraBold", size: 16))
                            .foregroundColor(.blueDark)
                            .padding(.leading, 15)
                    }
                    BlueCard()
                    BlueCard()
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .center, spacing: 12) {
                    ZStack(alignment: .leading) {
                        Image("SectionYellowBackground")
                        Text("Let’s broaden your discovery")
                            .font(.custom("Lato-ExtraBold", size: 16))
                            .foregroundColor(.blueDark)
                            .padding(.leading, 15)
                    }
                    YellowCard()
                }
            }
        }
    }
}

#Preview {
    MissionModalityView()
}
