//
//  TestView.swift
//  Quackary
//
//  Created by Bunga Prameswari on 25/06/24.
//

import SwiftUI

struct CardView: View {
    @Binding var imageName: String
    @Binding var rewardImageName: String
    
    var body: some View {
        ZStack {
            Image(imageName)
            HStack {
                Image("photo4")
                    .resizable()
                    .frame(width: 96, height: 96)
                    .cornerRadius(10)
                    .padding(.trailing, 2)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text("Butler's Steak")
                        .font(.custom("Lato-ExtraBold", size: 16))
                        .padding(.bottom, 4)
                    
                    HStack {
                        HStack(spacing: 0){
                            Text("$$")
                                .foregroundStyle(.blueDark)
                            Text("$$")
                                .foregroundStyle(.blueBlackLight)
                        }
                        Text("1 km")
                            .foregroundStyle(.blueDark)
                    }
                    .font(.custom("Lato-Regular", size: 13))
                    .padding(.bottom, 2)
                    
                    HStack {
                        Text("Open")
                            .foregroundStyle(.green)
                        Text(".")
                            .baselineOffset(5)
                        Text("Closes 20.00")
                            .foregroundStyle(.whiteBlueDark)
                    }
                    .font(.custom("Lato-Regular", size: 13))
                }
                Image(rewardImageName)
                    .resizable()
                    .frame(width: 96, height: 96)
            }
            .padding(.horizontal, 6)
        }
        .shadow(color: Color(red: 0.65, green: 0.65, blue: 0.65).opacity(0.25), radius: 4.05, x: 0, y: 0)
        .onTapGesture {
            Router.shared.path.append(.DetailPlace)
        }
    }
}
