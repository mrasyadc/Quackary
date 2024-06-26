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
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 10) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 107, height: 4)
                        .background(Color(red: 0.27, green: 0.48, blue: 0.62))
                        .cornerRadius(100)
                }
                .cornerRadius(10)
                VStack(alignment: .leading, spacing: 10) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 107, height: 4)
                        .background(Color(red: 0.93, green: 0.94, blue: 0.93))
                        .cornerRadius(100)
                }
                .cornerRadius(10)
                VStack(alignment: .leading, spacing: 10) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 107, height: 4)
                        .background(Color(red: 0.93, green: 0.94, blue: 0.93))
                        .cornerRadius(100)
                }
                .cornerRadius(10)
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            .frame(width: 393, height: 44)
            
            VStack(alignment: .leading) {
                Text("Your Food Restrictions")
                    .font(Font.custom("Lato-ExtraBold", size: 22))
                    .foregroundColor(.blueDarker)
                Text("Tell us what’s a no for you!")
                    .font(Font.custom("Lato-Regular", size: 16))
                    .foregroundColor(.blueDarker)
            }.padding()
            
            let columns = [
                GridItem(.flexible(minimum: 70)),
                GridItem(.flexible(minimum: 70)),
                GridItem(.flexible(minimum: 70)),
                GridItem(.flexible(minimum: 70)),
                GridItem(.flexible(minimum: 70)),
            ]
            
            HStack(alignment: .top, spacing: 12) {
                LazyVGrid(columns: columns, spacing: 12) {
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
            }
            .padding(0)
            .frame(width: 353, alignment: .topLeading)
            
            Spacer()
            
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
//                        Router.shared.path.append(<#T##Element#>)
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
