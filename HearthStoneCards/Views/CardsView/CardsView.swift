//
//  CardsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct CardsView: View {
    @State var selectedCategory: String = "Standard"
    var body: some View {
        NavigationView {
            VStack {
                CategoriesBarView(selectedCategory: $selectedCategory)
                
                ScrollView {
                    if selectedCategory == "Standard" {
                        TheBarrensCardSetView()
                    } else if selectedCategory == "Wild" {
                        SECTIONTESTVIEW()
                    } else if selectedCategory == "Classic" {
                        LatestCardsSetSectionView()
                    } else if selectedCategory == "Forged in the barrens" {
                        LatestCardsSetSectionView()
                    }else if selectedCategory == "Madness at the Darkmoon Faire" {
                        LatestCardsSetSectionView()
                    }
                }
            }
            .navigationTitle("Cards")
        }
            
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            
            
            
    }
}
