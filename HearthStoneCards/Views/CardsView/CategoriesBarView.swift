//
//  CategoriesBarView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/19.
//

import SwiftUI

struct CategoriesBarView: View {
    let categories = ["Standard", "Wild", "Classic", "Forged in the barrens", "Madness at the Darkmoon Faire"]
    @Binding var selectedCategory: String
    @Namespace private var animation
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories, id: \.self) {category in
                        Button(action: {
                            withAnimation(.spring()) {
                                selectedCategory = category
                            }
                        }, label: {
                            VStack(spacing: 4) {
                                Text(category)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .frame(height: 30)
                                    
                                    .padding(.horizontal)
                                    .background(selectedCategory == category ? Color.black.opacity(0.4) : Color.black.opacity(0.1))
                                    .clipShape(Capsule())
                                    .foregroundColor(selectedCategory == category ? .white : .secondary)
                                    .matchedGeometryEffect(id: category, in: animation, isSource: true)
                                
                            }
                        })
                        .accentColor(.primary)
                    }
                    .overlay(Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1)
                                .matchedGeometryEffect(id: selectedCategory, in: animation, isSource: false)
                                .foregroundColor(.yellow))
                }
            }
        }
        .padding()
    }
}

//struct CategoriesBarView_Previews: PreviewProvider {
//     
//    static var previews: some View {
//        CategoriesBarView(selectedCategory: )
//    }
//}
