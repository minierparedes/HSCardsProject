//
//  CardsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct CardsView: View {
    @State var selectedCategory: String = "Standard"
    @State var loadingState: CategoryLoadingState.SelectedCategoryView = .standard
    var body: some View {
        NavigationView {
            VStack {
                CategoriesBarView(selectedCategory: $selectedCategory)
                
                VStack {
                    CategoryLoadingState.categoryLoader(optionSelected: CategoryLoadingState.SelectedCategoryView(rawValue: selectedCategory)!)
                }
            }
            .navigationTitle(selectedCategory)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Image(selectedCategory)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.yellow)
                }
            }
        }
            
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            
            
            
    }
}


/*
 
 if selectedCategory == "Standard" {
     StandardCardsView()
 } else if selectedCategory == "Wild" {
     WildCardsView()
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
     AshesOfOutlandCardsView()
 } else if selectedCategory == "Core" {
     CoreCardsView()
 } else if selectedCategory == "Demon Hunter Initiate" {
     DemonHunterInitiateCardsView()
 } else if selectedCategory == "Galakrond's Awakening" {
     GalakrondAwakeningCardsView()
 } else if selectedCategory == "Descent of Dragons" {
     DescentOfDragonsCardsView()
 } else if selectedCategory == "Saviors of Uldum" {
     SaviorsOfUldumCardsView()
 } else if selectedCategory == "Rise of Shadows" {
     RiseOfShadowsCardsView()
 } else if selectedCategory == "Rastakhan's Rumble" {
     RastakhanRumbleCardsView()
 } else if selectedCategory == "The Boomsday Project" {
     TheBoomsdayProjectCardsView()
 } else if selectedCategory == "The Witchwood" {
     TheWitchwoodCardsView()
 } else if selectedCategory == "Kobolds & Catacombs" {
     KoboldsCatacombsCardsView()
 } else if selectedCategory == "Knights of the Frozen Throne" {
     KnightsOfTheFrozenThroneCardsView()
 } else if selectedCategory == "Journey to Un'Goro" {
     JourneyToUnGoroCardsView()
 } else if selectedCategory == "Mean Streets of Gadgetzan" {
     MeanStreetsOfGadgetzanCardsView()
 } else if selectedCategory == "One Night in Karazhan" {
     OneNightInKarazhanCardsView()
 } else if selectedCategory == "Whispers of the Old Gods" {
     WhispersOfTheOldGodsCardsView()
 } else if selectedCategory == "The League of Explorers" {
     TheLeagueOfExplorersCardsView()
 } else if selectedCategory == "The Grand Tournament" {
     TheGrandTournamentCardsView()
 } else if selectedCategory == "Blackrock Mountain" {
     BlackrockMoutainCardsView()
 } else if selectedCategory == "Goblins vs Gnomes" {
     GoblinsGnomesCardsView()
 } else if selectedCategory == "Curse of Naxxramas" {
     CurseOfNaxxramasCardsView()
 } else if selectedCategory == "Legacy" {
     LegacyCardsView()
 }
 
 
 
 */
