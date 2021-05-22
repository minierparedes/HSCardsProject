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
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedCategory == category ? .primary : .secondary)
                                    .matchedGeometryEffect(id: category, in: animation, isSource: true)
                                
                            }
                        })
                        .accentColor(.primary)
                    }
                    .overlay(RoundedRectangle(cornerRadius: 5)
                                .frame(height: 2)
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
