//
//  FavoriteFoodView.swift
//  Quackary
//
//  Created by Romi Fadhurohman Nabil on 26/06/24.
//

import SwiftUI
import SwiftData

enum PreferenceType: String, CaseIterable, Hashable, Codable, Equatable {
    case Beef, Bento, Cheese, Chicken, Duck, Egg, Fish, FriesFood, Fruit, Lamb, Martabak, Meatball, Milk, Pasta, Pizza, PlantBased, Pork, Porridge, Ramen, Rea, Salad, Sandiwch, Satay, Soup, Steak, Sushi, Tempeh, Tofu, Vegetable, Yogurt
}

struct FavoriteFoodView: View {
    @State private var selectedFavorites: Set<PreferenceType> = []
    
    var body: some View {
        ZStack {
            Image("GradientBackground")
            
            VStack {
                HStack(spacing: 12) {
                    Rectangle()
                        .foregroundColor(.blueNormal)
                        .frame(width: 107, height: 4)
                        .cornerRadius(100)
                    
                    Rectangle()
                        .foregroundColor(.blueNormal)
                        .frame(width: 107, height: 4)
                        .cornerRadius(100)
                    
                    Rectangle()
                        .foregroundColor(.darkGreenLight)
                        .frame(width: 107, height: 4)
                        .cornerRadius(100)
                }
                .padding(.top, 54)
                .padding(.vertical, 20)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Your Ultimate Food Favorites")
                            .font(Font.custom("Lato-ExtraBold", size: 22))
                            .foregroundColor(.blueDarker)
                        Text("Tell us at least 3 food you can't live without!")
                            .font(Font.custom("Lato-Regular", size: 16))
                            .foregroundColor(.blueDarker)
                    }
                    .padding(.vertical, 24)
                    
                    ScrollView {
                        GeometryReader { geometry in
                            self.generateContent(in: geometry)
                        }
                        .frame(height: self.calculateHeight())
                    }
                    .frame(maxWidth: .infinity)
                    
                    HStack {
                        Button(action: {
                            // Handle previous action here
                            Router.shared.path.popLast()
                        }) {
                            Image("Back_Button")
                                .resizable()
                                .frame(width: 48, height: 48)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if selectedFavorites.count >= 3 {
                            Button(action: {
                                // Handle the next action here
                               // Router.shared.path.append(<#T##Element#>)
                            }) {
                                Image("Next_Button")
                                    .resizable()
                                    .frame(width: 294, height: 48)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        } else {
                            Image("Next_Button_Hidden")
                                .resizable()
                                .frame(width: 294, height: 48)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .padding(.bottom, 62)
                    
                }
                .padding(.horizontal, 20)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        let width = geometry.size.width
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        return ZStack(alignment: .topLeading) {
            ForEach(PreferenceType.allCases, id: \.self) { favorite in
                self.item(for: favorite)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        if (abs(x - dimension.width) > width) {
                            x = 0
                            y -= dimension.height
                        }
                        let result = x
                        if favorite == PreferenceType.allCases.last {
                            x = 0 // last item
                        } else {
                            x -= dimension.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = y
                        if favorite == PreferenceType.allCases.last {
                            y = 0 // last item
                        }
                        return result
                    })
            }
        }
    }
    
    private func calculateHeight() -> CGFloat {
        var height: CGFloat = 0
        let width: CGFloat = UIScreen.main.bounds.width - 32 // Assuming 16 padding on each side
        var x: CGFloat = 0
        
        for favorite in PreferenceType.allCases {
            let itemWidth = self.size(for: favorite).width + 8
            if (abs(x - itemWidth) > width) {
                x = 0
                height += self.size(for: favorite).height + 8
            }
            x -= itemWidth
        }
        height += self.size(for: PreferenceType.allCases.last!).height + 8
        return height
    }
    
    private func size(for favorite: PreferenceType) -> CGSize {
        let label = UILabel()
        label.text = favorite.rawValue
        return label.frame.size
    }
    
    private func item(for favorite: PreferenceType) -> some View {
        Button(action: {
            if selectedFavorites.contains(favorite) {
                selectedFavorites.remove(favorite)
            } else {
                selectedFavorites.insert(favorite)
            }
        }) {
            Text(favorite.rawValue)
                .font(Font.custom("Lato-Regular", size: 14))
                .padding(.horizontal, 18)
                .padding(.vertical, 14)
                .background(selectedFavorites.contains(favorite) ? .yellowNormal : .darkGreenLight)
                .cornerRadius(21)
                .foregroundColor(.blueDarker)
        }
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        FavoriteFoodView()
    }
}
