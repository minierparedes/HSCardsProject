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
                        StandardCardSetView()
                            .font(.title)
                    } else if selectedCategory == "Wild" {
                        Text("WILD")
                            .font(.title)
                    } else if selectedCategory == "Classic" {
                        Text("CLASSIC")
                            .font(.title)
                    } else if selectedCategory == "Forged in the barrens" {
                        TheBarrensCardSetView()
                    }else if selectedCategory == "Madness at the Darkmoon Faire" {
                        DarkmoonFaireCardSetView()
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
