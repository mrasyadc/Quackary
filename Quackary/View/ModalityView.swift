//
//  ModalityView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 25/06/24.
//

import SwiftUI

struct ModalityView: View {
    @State private var offset: CGFloat = UIScreen.main.bounds.height - 200
    @State private var lastOffset: CGFloat = UIScreen.main.bounds.height - 200
    
    var body: some View {
        ZStack {
            // Background View (keep as is for now)
            // Uncomment the following lines to include the background image or world view
            // Image("photo4")
            //     .resizable()
            //     .ignoresSafeArea()
             WorldView()

            VStack {
                Spacer()
                
                // Modal content
                VStack {
                    Image("Resize Indicator")
                        .padding(.bottom, 15)
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Places to visit this week")
                                    .font(.custom("Lato-ExtraBold", size: 22))
                                Text("Explore, check in, and gain rewards!")
                                    .font(.custom("Lato-Regular", size: 16))
                            }
                            .foregroundColor(Color.blue)
                            
                            Spacer()
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.red.opacity(0.2))
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                Text("7 days left")
                                    .font(.custom("Lato-ExtraBold", size: 13))
                                    .foregroundColor(Color.red)
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
                                    .foregroundColor(Color.blue)
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
                                    .foregroundColor(Color.blue)
                                    .padding(.leading, 15)
                            }
                            YellowCard()
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let dragOffset = value.translation.height
                            offset = lastOffset + dragOffset
                        }
                        .onEnded { value in
                            if offset < UIScreen.main.bounds.height / 2 {
                                withAnimation {
                                    offset = 0
                                }
                            } else {
                                withAnimation {
                                    offset = UIScreen.main.bounds.height - 200
                                }
                            }
                            lastOffset = offset
                        }
                )
            }
        }
    }
}

#Preview {
    ModalityView()
}
