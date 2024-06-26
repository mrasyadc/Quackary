//
//  RestrictFoodView.swift
//  Quackary
//
//  Created by Romi Fadhurohman Nabil on 25/06/24.
//

import SwiftUI
import SwiftData

enum RestrictType: String, CaseIterable, Hashable, Codable, Equatable {
    case Alcohol, TreeNuts, Beef, Wheat, Shrimp, Fish, Gluten, Pork, Seafood, Milk, Soy, Peanuts, Eggs, Dairy, Sesame, Shellfish
}

struct RestrictFoodView: View {
    @State private var selectedRestrictions: Set<RestrictType> = []
    
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
                        .foregroundColor(.darkGreenLight)
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
                        Text("Your Food Restrictions")
                            .font(Font.custom("Lato-ExtraBold", size: 22))
                            .foregroundColor(.blueDarker)
                        Text("Tell us what’s a no for you!")
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
                        
                        if selectedRestrictions.count >= 3 {
                            Button(action: {
                                // Handle the next action here
                                Router.shared.path.append(.FavoriteFoodView)
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
            ForEach(RestrictType.allCases, id: \.self) { restriction in
                self.item(for: restriction)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        if (abs(x - dimension.width) > width) {
                            x = 0
                            y -= dimension.height
                        }
                        let result = x
                        if restriction == RestrictType.allCases.last {
                            x = 0 // last item
                        } else {
                            x -= dimension.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = y
                        if restriction == RestrictType.allCases.last {
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
        
        for restriction in RestrictType.allCases {
            let itemWidth = self.size(for: restriction).width + 8
            if (abs(x - itemWidth) > width) {
                x = 0
                height += self.size(for: restriction).height + 8
            }
            x -= itemWidth
        }
        height += self.size(for: RestrictType.allCases.last!).height + 8
        return height
    }
    
    private func size(for restriction: RestrictType) -> CGSize {
        let label = UILabel()
        label.text = restriction.rawValue
        return label.frame.size
    }
    
    private func item(for restriction: RestrictType) -> some View {
        Button(action: {
            if selectedRestrictions.contains(restriction) {
                selectedRestrictions.remove(restriction)
            } else {
                selectedRestrictions.insert(restriction)
            }
        }) {
            Text(restriction.rawValue)
                .font(Font.custom("Lato-Regular", size: 14))
                .padding(.horizontal, 18)
                .padding(.vertical, 14)
                .background(selectedRestrictions.contains(restriction) ? .yellowNormal : .darkGreenLight)
                .cornerRadius(21)
                .foregroundColor(.blueDarker)
        }
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        RestrictFoodView()
    }
}
