//
//  DetailPlaceView.swift
//  Quackary
//
//  Created by Evelyn Santoso on 24/06/24.
//

import SwiftUI

struct DetailPlaceView: View {
    private let samplePhoto = [ "photo1",
                                "photo2",
                                "photo3"]

    var body: some View {

            VStack{
            
            // BOTTOM BAR
                HStack(alignment: .center) {
                    
                    //BACK BUTTON
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                       
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .foregroundColor(Color(red: 69/255.0, green: 123/255.0, blue: 157/255.0))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        })
  
                    Spacer()
                    
                    //ROUTE BUTTON
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                       
                        Image(systemName: "arrow.triangle.turn.up.right.diamond")
                            .resizable()
                            .foregroundColor(Color(red: 69/255.0, green: 123/255.0, blue: 157/255.0))
                        
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 23, height: 23)
                        })
                    
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 70, maxHeight: 70, alignment: .center)
                .overlay(
                    //CENTER OF BAR
                    HStack{
                        
                        //VSTACK : PLACE (TOP OF VIEW)
                        VStack(alignment: .leading){
                            
                            
                            //PLACE NAME (TOP)
                            Text("B’Steak Grill & Pancake")
                                .font(Font.custom("Lato", size: 22)
                                    .weight(.heavy)
                                )
                                .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                                
                            //DETAIL PLACE (TOP)
                            HStack{
                                Text("Steak House")
                                    .font(Font.custom("Lato", size: 12))
                                    .foregroundColor(.black)
                                
                                Image( systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 2.8125, height: 2.8125)
                                
                                Text("$$$$")
                                    .font(Font.custom("Lato", size: 13))
                                    .foregroundColor(.black)
                                
                                Image( systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 2.8125, height: 2.8125)
                                
                                Text("1 km")
                                    .font(Font.custom("Lato", size: 13))
                                    .foregroundColor(.black)
                                
                            } // HSTACK : DETAIL PLACE (TOP)
                            .padding(.top, -9.0)

                        } //VSTACK : PLACE (TOP OF VIEW)
                        .padding(.leading, -22.0)
                        
                    }// HSTACK : CENTER OF BAR
                
                
                ) // OVERLAY : CENTER OF BAR
                
                
                //Carousell imgae
                ScrollView(.horizontal) {
                    
                    LazyHStack(spacing: 0) {
                        ForEach(samplePhoto, id: \.self) { photo in
                        
                            Image(photo)
                                .resizable()
                                .scaledToFill()
                                .padding(.horizontal, 20)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                .frame(width: 239, height: 319)
                                .cornerRadius(10)
                            Spacer()
                        }
                    }.scrollTargetLayout()
                }.scrollTargetBehavior(.viewAligned)
                
                
                //VSTACK : DESCRIPTION
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        //LOCATION SYMBOL
                        Image(systemName: "mappin.and.ellipse.circle")
                            .frame(width: 14, height: 19)
                            .foregroundColor(.gray)
                            .padding(.bottom, 25.0)
                        
                        //F&B ADDRESS
                        Text("Ruko Golden 8, Gading Serpong Jl. Ki Hajar Dewantara No.3, Pakulonan Bar., Kec. Klp.Dua, Kabupaten Tangerang, Banten 15811")
                        .font(Font.custom("Lato", size: 13))
                        .foregroundColor(Color(red: 0.09, green: 0.17, blue: 0.22))
                        .frame(width: 317, alignment: .leading)
                    }
                    
                    HStack{
                        //TIME SYMBOL
                        Image(systemName: "clock")
                        .frame(width: 14, height: 14)
                        .foregroundColor(.gray)
                    
        
                        
                        //OPEN TEXT
                        Text("Open")
                          .font(Font.custom("Lato", size: 13))
                          .foregroundColor(Color(red: 0.14, green: 0.59, blue: 0.15))
                        
                        Image(".")
                        .frame(width: 1.66193, height: 1.66193)
                        .background(.black)
                        
                        
                        // CLOSES TEXT
                        Text("Closes 20.00")
                          .font(Font.custom("Lato", size: 13))
                          .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
                    }
                    
                    //BUTTON MORE INFO
                    Button(action: {
                       
                       
                    }) {
                        Text("More Info")
                        
                            .font(
                            Font.custom("DM Sans", size: 14)
                            .weight(.medium)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.27, green: 0.48, blue: 0.62))
                            .frame(width:339, height:36,alignment: .center)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 231/255.0, green: 232/255.0, blue: 234/255.0), lineWidth: 1)
                        )
                    } //BUTTON MORE INFO
                    
                }//VSTACK : DESCRIPTION
                .padding(10)
                
            //CARD CHECK IN
                //BACKGROUND CARD CHECK IN
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                    
                    .foregroundColor(Color(red: 0.95, green: 0.98, blue: 0.98))
                    .frame(width: 356, height: 119)
                       
                    
                    HStack{
                        
                        //VSTACK CARD CONTENT
                        VStack(alignment: .leading, spacing: 7) {
                            
                            // TAG TEXT
                            Text("🍖 Meat Your Match")
                                .frame(width: 121)
                                .font(Font.custom("Lato", size: 11))
                                .kerning(0.0066)
                                .foregroundColor(Color(red: 0.27, green: 0.48, blue: 0.62))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Color(red: 1, green: 1, blue: 0.99))
                                .cornerRadius(13)
                            
                            Text("Visit this place to get the reward!")
                            .font(
                            Font.custom("Lato", size: 16)
                            .weight(.heavy)
                            )
                            .foregroundColor(Color(red: 0.27, green: 0.48, blue: 0.62))

                            .frame(width: 241, alignment: .leading)
                            
                      
                            
                            Text("Check in by taking an amazing photo of your experience.")
                            .font(Font.custom("Lato", size: 12))
                            .foregroundColor(Color(red: 0.27, green: 0.48, blue: 0.62))

                            .frame(width: 217, alignment: .leading)
                            
                        }//VSTACK CARD CONTENT
                        
                        Image("Variant3")
                        
                    }

                    
                }//BACKGROUND CARD CHECK IN
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                
                
            //BUTTON CHECK IN
            Button(action: {
                   
                   
            }) {
                        
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
                   
                } //BUTTON CHECK IN
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
}

#Preview {
    DetailPlaceView()
}

