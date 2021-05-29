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
                        StandardCardsView()
                            .font(.title)
                    } else if selectedCategory == "Wild" {
                        WildCardsView()
                            .font(.title)
                    } else if selectedCategory == "Classic" {
                        Text("CLASSIC")
                            .font(.title)
                    } else if selectedCategory == "Forged in the barrens" {
                        TheBarrensCardsView()
                    } else if selectedCategory == "Madness at the Darkmoon Faire" {
                        DarkmoonFaireCardsView()
                    } else if selectedCategory == "Scholomance Academy" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Ashes of Outland" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Core" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Demon Hunter Initiate" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Galakrond's Awakening" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Descent of Dragons" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Saviors of Uldum" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Rise of Shadows" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Rastakhan's Rumble" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "The Boomsday Project" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "The Witchwood" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Kobolds & Catacombs" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Knights of the Frozen Throne" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Journey to Un'Goro" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Mean Streets of Gadgetzan" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "One Night in Karazhan" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Whispers of the Old Gods" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "The League of Explorers" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "The Grand Tournament" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Blackrock Mountain" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Goblins vs Gnomes" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Curse of Naxxramas" {
                        ScholomanceCardsView()
                    } else if selectedCategory == "Legacy" {
                        ScholomanceCardsView()
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
