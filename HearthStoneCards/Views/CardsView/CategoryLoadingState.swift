//
//  CategoryLoadingState.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/30.
//

import SwiftUI

enum CategoryLoadingState {
    enum SelectedCategoryView: String, CaseIterable {
        case standard = "Standard"
        case wild = "Wild"
        case theBarrens = "Forged in the barrens"
        case classic = "Classic"
        case darkmoonFaire = "Madness at the Darkmoon Faire"
        case scholomance = "Scholomance Academy"
        case ashesOfOutland = "Ashes of Outland"
        case core = "Core"
        case demonHunterInitiate = "Demon Hunter Initiate"
        case galakronAwakening = "Galakrond's Awakening"
        case descentOfDragons = "Descent of Dragons"
        case saviorsOfUldum = "Saviors of Uldum"
        case riseOfShadows = "Rise of Shadows"
        case rastakhanRumble = "Rastakhan's Rumble"
        case theBoomsdayProject = "The Boomsday Project"
        case theWitchwood = "The Witchwood"
        case koboldsCatacombs = "Kobolds & Catacombs"
        case knightsOfTheFrozenThrone = "Knights of the Frozen Throne"
        case journeyToUnGoro = "Journey to Un'Goro"
        case meanStreetsOfGadgetzan = "Mean Streets of Gadgetzan"
        case oneNightInKarazhan = "One Night in Karazhan"
        case whispersOfTheOldGods = "Whispers of the Old Gods"
        case theLeagueOFExplorers = "The League of Explorers"
        case theGrandTournament = "The Grand Tournament"
        case blackRockMountain = "Blackrock Mountain"
        case goblinsGnomes = "Goblins vs Gnomes"
        case curseOfNaxxramas = "Curse of Naxxramas"
        case legacy = "Legacy"
    }
    
   @ViewBuilder static func categoryLoader(optionSelected: SelectedCategoryView) -> some View {
        switch optionSelected {
        case .standard:
             StandardCardsView()
        case .wild:
             WildCardsView()
        case .theBarrens:
             TheBarrensCardsView()
        case .classic:
             Text("CLASSIC")
        case .darkmoonFaire:
            DarkmoonFaireCardsView()
        case .scholomance:
            ScholomanceCardsView()
        case .ashesOfOutland:
            AshesOfOutlandCardsView()
        case .core:
            CoreCardsView()
        case .demonHunterInitiate:
            DemonHunterInitiateCardsView()
        case .galakronAwakening:
            GalakrondAwakeningCardsView()
        case .descentOfDragons:
            DescentOfDragonsCardsView()
        case .saviorsOfUldum:
            SaviorsOfUldumCardsView()
        case .riseOfShadows:
            RiseOfShadowsCardsView()
        case .rastakhanRumble:
            RastakhanRumbleCardsView()
        case .theBoomsdayProject:
            TheBoomsdayProjectCardsView()
        case .theWitchwood:
            TheWitchwoodCardsView()
        case .koboldsCatacombs:
            KoboldsCatacombsCardsView()
        case .knightsOfTheFrozenThrone:
            KnightsOfTheFrozenThroneCardsView()
        case .journeyToUnGoro:
            JourneyToUnGoroCardsView()
        case .meanStreetsOfGadgetzan:
            MeanStreetsOfGadgetzanCardsView()
        case .oneNightInKarazhan:
            OneNightInKarazhanCardsView()
        case .whispersOfTheOldGods:
            WhispersOfTheOldGodsCardsView()
        case .theLeagueOFExplorers:
            TheLeagueOfExplorersCardsView()
        case .theGrandTournament:
            TheGrandTournamentCardsView()
        case .blackRockMountain:
            BlackrockMoutainCardsView()
        case .goblinsGnomes:
            GoblinsGnomesCardsView()
        case .curseOfNaxxramas:
            CurseOfNaxxramasCardsView()
        case .legacy:
            LegacyCardsView()
        }
    }
}
