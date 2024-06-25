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
        VStack(alignment: .leading) {
            
            Text("Your Food Restrictions")
                .font(Font.custom("Lato-ExtraBold", size: 22))
                .foregroundColor(.blueDarker)
            Text("Tell us what’s a no for you!")
                .font(Font.custom("Lato-Regular", size: 16))
                .foregroundColor(.blueDarker)
            
            let columns = [
                GridItem(.flexible(minimum: 70)),
                GridItem(.flexible(minimum: 70)),
                GridItem(.flexible(minimum: 70)),
                GridItem(.flexible(minimum: 70)),
                GridItem(.flexible(minimum: 70))
            ]
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(RestrictType.allCases, id: \.self) { restriction in
                    Button(action: {
                        if selectedRestrictions.contains(restriction) {
                            selectedRestrictions.remove(restriction)
                        } else {
                            selectedRestrictions.insert(restriction)
                        }
                    }) {
                        Text(restriction.rawValue)
                            .padding(.vertical, 30)
                            .frame(maxWidth: .infinity)
                            .background(selectedRestrictions.contains(restriction) ? Color.orange : Color.gray.opacity(0.2))
                            .cornerRadius(21)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
            Spacer()
            
            HStack {
                Button(action: {
                    // Handle previous action here
                }) {
                    Image("Back_Button")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if selectedRestrictions.count >= 3 {
                    Button(action: {
                        // Handle the next action here
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
            .padding()
        }
        .padding()
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        RestrictFoodView()
    }
}
