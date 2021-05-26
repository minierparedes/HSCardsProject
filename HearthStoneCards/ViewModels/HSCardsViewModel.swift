//
//  HSCardsViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import Combine
import SwiftUI

class HSCardsViewModel: ObservableObject {
    @Published var hsCardsData: [HSCardModel] = []
    @Published var cardSets: [HSCardModel] = []
    @Published var cardClasses: [HSCardModel] = []
    @Published var cardTypes: [HSCardModel] = []
    @Published var wildFormatCards: [HSCardModel] = []
    @Published var standardFormatCards: [HSCardModel] = []
    @Published var adventureGameModeCards: [HSCardModel] = []
    @Published var expansionCardSets: [HSCardModel] = []
    @Published var latestCardSets: [HSCardModel] = []
    
    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    let dataService = HSCardsModelDataService.hsCardsModelDataServiceInstance
    
    
    let cardClassNames: [String] = ["HUNTER", "DEMONHUNTER", "NEUTRAL", "MAGE", "PRIEST", "WARLOCK", "ROGUE", "DRUID", "SHAMAN", "PALADIN", "WARRIOR"]
    
    let wildCardSetNamesYear2021: [String] = ["NAXX", "GVG", "BRM", "TGT", "LOE", "OG", "KARA", "GANGS", "UNGORO", "ICECROWN", "LOOTAPALOOZA", "GILNEAS", "BOOMSDAY", "TROLL", "DALARAN", "ULDUM", "DRAGONS", "YEAR_OF_THE_DRAGON", "DEMON_HUNTER_INITIATE", "LEGACY"]
    
    let standardCardSetNamesYear2021: [String] = ["BLACK_TEMPLE", "SCHOLOMANCE", "DARKMOON_FAIRE", "THE_BARRENS", "CORE",]
    
    let adventureCardSetNamesYear2021: [String] = ["NAXX", "BRM", "LOE", "KARA", "GANGS"]
    
    let expansionCardSetNamesYear2021: [String] = ["UNGORO", "ICECROWN", "LOOTAPALOOZA", "GILNEAS", "BOOMSDAY", "TROLL", "DALARAN", "ULDUM", "DRAGONS", "YEAR_OF_THE_DRAGON", "GVG", "TGT", "OG", "BLACK_TEMPLE", "SCHOLOMANCE", "DARKMOON_FAIRE", "THE_BARRENS",]
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        isLoading = dataService.isLoadingDataService 
        dataService.$hsCardsModelData
            .sink { [weak self] (receivedHSCardModel) in
                self?.hsCardsData = receivedHSCardModel
                self?.cardSets = self!.hsCardsData.filter({ $0.set == "THE_BARRENS" })
                self?.cardClasses = self!.hsCardsData.filter({ self!.cardClassNames.contains($0.cardClass ?? "") })
                self?.wildFormatCards = self!.hsCardsData.filter({ self!.wildCardSetNamesYear2021.contains($0.set ?? "") })
                self?.latestCardSets = self!.hsCardsData.filter({ $0.set == "THE_BARRENS" && $0.cardClass == "NEUTRAL" && $0.rarity == "RARE"})
            }
            .store(in: &cancellables)
    }
}
