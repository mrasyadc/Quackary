//
//  TestView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 25/06/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            Color.whiteBlueLight
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Resize Indicator")
                    .padding(.bottom, 15)
        
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
                            .fill(.redLightHover)
                            .frame(minWidth: 0, maxWidth: .infinity)
                        Text("7 days left")
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
                            .foregroundStyle(.blueDark)
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
                            .foregroundStyle(.blueDark)
                            .padding(.leading, 15)
                    }
                    YellowCard()
                }
            }
        }
    }
}

#Preview {
    TestView()
}
