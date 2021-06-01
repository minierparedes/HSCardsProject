//
//  HSCardCategoryViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/23.
//

import Combine
import SwiftUI

class HSCardsViewModel: Identifiable, ObservableObject {
    @Published var standardCardSetDATA: [HSCardModel] = []
    @Published var wildCardSetNamesYear2021DATA: [HSCardModel] = []
    @Published var theBarrensCardSetDATA: [HSCardModel] = []
    @Published var darkmoonFaireCardSetDATA: [HSCardModel] = []
    @Published var scholomanceCardSetDATA: [HSCardModel] = []
    @Published var blackTempleCardSetDATA: [HSCardModel] = []
    @Published var coreCardSetDATA: [HSCardModel] = []
    @Published var demonHunterInitiateCardSetDATA: [HSCardModel] = []
    @Published var naxxCardSetDATA: [HSCardModel] = []
    @Published var gvgCardSetDATA: [HSCardModel] = []
    @Published var brmCardSetDATA: [HSCardModel] = []
    @Published var tgtCardSetDATA: [HSCardModel] = []
    @Published var loeCardSetDATA: [HSCardModel] = []
    @Published var ogCardSetDATA: [HSCardModel] = []
    @Published var karaCardSetDATA: [HSCardModel] = []
    @Published var gangsCardSetDATA: [HSCardModel] = []
    @Published var ungoroCardSetDATA: [HSCardModel] = []
    @Published var iceCrownCardSetDATA: [HSCardModel] = []
    @Published var lootApaloozaCardSetDATA: [HSCardModel] = []
    @Published var gilneasCardSetDATA: [HSCardModel] = []
    @Published var boomsdayCardSetDATA: [HSCardModel] = []
    @Published var trollCardSetDATA: [HSCardModel] = []
    @Published var dalaranCardSetDATA: [HSCardModel] = []
    @Published var uldumCardSetDATA: [HSCardModel] = []
    @Published var dragonsCardSetDATA: [HSCardModel] = []
    @Published var yearOfTheDragonCardSetDATA: [HSCardModel] = []
    @Published var legacyCardSetDATA: [HSCardModel] = []
    
   
    let standardCardSetNamesYear2021: [String] = ["BLACK_TEMPLE", "SCHOLOMANCE", "DARKMOON_FAIRE", "THE_BARRENS", "CORE"]
    let wildCardSetNamesYear2021: [String] = ["NAXX", "GVG", "BRM", "TGT", "LOE", "OG", "KARA", "GANGS", "UNGORO", "ICECROWN", "LOOTAPALOOZA", "GILNEAS", "BOOMSDAY", "TROLL", "DALARAN", "ULDUM", "DRAGONS", "YEAR_OF_THE_DRAGON", "DEMON_HUNTER_INITIATE", "LEGACY"]
    
    var cancellables = Set<AnyCancellable>()
    
    let dataService = HSCardsModelDataService.hsCardsModelDataServiceInstance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$hsCardsModelData
            .sink { [weak self] (receivedHSCardModel) in
                self?.standardCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ self!.standardCardSetNamesYear2021.contains($0.set ?? "") && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.wildCardSetNamesYear2021DATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ self!.wildCardSetNamesYear2021.contains($0.set ?? "") && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.theBarrensCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "THE_BARRENS" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.darkmoonFaireCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "DARKMOON_FAIRE" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.scholomanceCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "SCHOLOMANCE" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })// HERO_POWER
                self?.blackTempleCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "BLACK_TEMPLE" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.coreCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "CORE" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.demonHunterInitiateCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "DEMON_HUNTER_INITIATE" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.naxxCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "NAXX" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.gvgCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "GVG" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.brmCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "BRM" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.tgtCardSetDATA = receivedHSCardModel//
                    .compactMap({ $0 })
                    .filter({ $0.set == "TGT" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.loeCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "LOE" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.ogCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "OG" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.karaCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "KARA" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.gangsCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "GANGS" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.ungoroCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "UNGORO" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.iceCrownCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "ICECROWN" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.lootApaloozaCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "LOOTAPALOOZA" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.gilneasCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "GILNEAS" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.boomsdayCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "BOOMSDAY" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.trollCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "TROLL" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.dalaranCardSetDATA = receivedHSCardModel//
                    .compactMap({ $0 })
                    .filter({ $0.set == "DALARAN" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.uldumCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "ULDUM" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.dragonsCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "DRAGONS" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.yearOfTheDragonCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "YEAR_OF_THE_DRAGON" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                self?.legacyCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "LEGACY" && $0.name != "???" && $0.type != "HERO_POWER" && $0.cardClass != "DEATHKNIGHT" })
                
            }
            .store(in: &cancellables)
    }
     
}


/*
 Func for Dictionary grouping of array elemenets **PENDING**
 
 @Published var groupedCardClasses = [[HSCardModel]]()
 
 func groupCardClasses() {
    let groupedClassesDictionary = Dictionary(grouping: theBarrensCardSetDATA) { (elementCardClass) -> String in
        return elementCardClass.cardClass ?? ""
    }
    
    let keys = groupedClassesDictionary.keys.sorted()
    keys.forEach { (key) in
        groupedCardClasses.append(groupedClassesDictionary[key]!)
    }
}
 
 */
