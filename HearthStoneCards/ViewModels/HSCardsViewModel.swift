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
                    .filter({ self!.standardCardSetNamesYear2021.contains($0.set ?? "") && $0.name != "???" })
                self?.wildCardSetNamesYear2021DATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ self!.wildCardSetNamesYear2021.contains($0.set ?? "") && $0.name != "???" })
                self?.theBarrensCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "THE_BARRENS" && $0.name != "???" })
                self?.darkmoonFaireCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "DARKMOON_FAIRE" && $0.name != "???" })
                self?.scholomanceCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "SCHOLOMANCE" && $0.name != "???" })//from here down
                self?.blackTempleCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "BLACK_TEMPLE" && $0.name != "???" })
                self?.coreCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "CORE" && $0.name != "???" })
                self?.demonHunterInitiateCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "DEMON_HUNTER_INITIATE" && $0.name != "???" })
                self?.naxxCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "NAXX" && $0.name != "???" })
                self?.gvgCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "GVG" && $0.name != "???" })
                self?.brmCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "BRM" && $0.name != "???" })
                self?.tgtCardSetDATA = receivedHSCardModel//
                    .compactMap({ $0 })
                    .filter({ $0.set == "TGT" && $0.name != "???" })
                self?.loeCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "LOE" && $0.name != "???" })
                self?.ogCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "OG" && $0.name != "???" })
                self?.karaCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "KARA" && $0.name != "???" })
                self?.gangsCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "GANGS" && $0.name != "???" })
                self?.ungoroCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "UNGORO" && $0.name != "???" })
                self?.iceCrownCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "ICECROWN" && $0.name != "???" })
                self?.lootApaloozaCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "LOOTAPALOOZA" && $0.name != "???" })
                self?.gilneasCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "GILNEAS" && $0.name != "???" })
                self?.boomsdayCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "BOOMSDAY" && $0.name != "???" })
                self?.trollCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "TROLL" && $0.name != "???" })
                self?.dalaranCardSetDATA = receivedHSCardModel//
                    .compactMap({ $0 })
                    .filter({ $0.set == "DALARAN" && $0.name != "???" })
                self?.uldumCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "ULDUM" && $0.name != "???" })
                self?.dragonsCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "DRAGONS" && $0.name != "???" })
                self?.yearOfTheDragonCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "YEAR_OF_THE_DRAGON" && $0.name != "???" })
                self?.legacyCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "LEGACY" && $0.name != "???" })
                
            
                print("*****\n theBarrensCardSetDATA \n***** element count: \(self?.theBarrensCardSetDATA.count)")
                print("*****\n darkmoonFaireCardSetDATA \n***** element count: \(self?.darkmoonFaireCardSetDATA.count)")
                print("*****\n standardCardSetDATA \n***** element count: \(self?.standardCardSetDATA.count)")
                print("*****\n wildCardSetNamesYear2021DATA \n***** element count: \(self?.wildCardSetNamesYear2021DATA.count)")
                print("*****\n theBarrensCardSetDATA \n***** element count: \(self?.scholomanceCardSetDATA.count)")
                print("*****\n darkmoonFaireCardSetDATA \n***** element count: \(self?.blackTempleCardSetDATA.count)")
                print("*****\n standardCardSetDATA \n***** element count: \(self?.coreCardSetDATA.count)")
                print("*****\n wildCardSetNamesYear2021DATA \n***** element count: \(self?.demonHunterInitiateCardSetDATA.count)")
                print("*****\n theBarrensCardSetDATA \n***** element count: \(self?.naxxCardSetDATA.count)")
                print("*****\n darkmoonFaireCardSetDATA \n***** element count: \(self?.gvgCardSetDATA.count)")
                print("*****\n standardCardSetDATA \n***** element count: \(self?.brmCardSetDATA.count)")
                print("*****\n wildCardSetNamesYear2021DATA \n***** element count: \(self?.tgtCardSetDATA.count)")
                print("*****\n theBarrensCardSetDATA \n***** element count: \(self?.loeCardSetDATA.count)")
                print("*****\n darkmoonFaireCardSetDATA \n***** element count: \(self?.ogCardSetDATA.count)")
                print("*****\n standardCardSetDATA \n***** element count: \(self?.karaCardSetDATA.count)")
                print("*****\n wildCardSetNamesYear2021DATA \n***** element count: \(self?.gangsCardSetDATA.count)")
                print("*****\n theBarrensCardSetDATA \n***** element count: \(self?.ungoroCardSetDATA.count)")
                print("*****\n darkmoonFaireCardSetDATA \n***** element count: \(self?.iceCrownCardSetDATA.count)")
                print("*****\n standardCardSetDATA \n***** element count: \(self?.lootApaloozaCardSetDATA.count)")
                print("*****\n wildCardSetNamesYear2021DATA \n***** element count: \(self?.gilneasCardSetDATA.count)")
                print("*****\n wildCardSetNamesYear2021DATA \n***** element count: \(self?.boomsdayCardSetDATA.count)")
                print("*****\n theBarrensCardSetDATA \n***** element count: \(self?.trollCardSetDATA.count)")
                print("*****\n darkmoonFaireCardSetDATA \n***** element count: \(self?.dalaranCardSetDATA.count)")
                print("*****\n standardCardSetDATA \n***** element count: \(self?.uldumCardSetDATA.count)")
                print("*****\n wildCardSetNamesYear2021DATA \n***** element count: \(self?.dragonsCardSetDATA.count)")
                print("*****\n theBarrensCardSetDATA \n***** element count: \(self?.yearOfTheDragonCardSetDATA.count)")
                print("*****\n darkmoonFaireCardSetDATA \n***** element count: \(self?.legacyCardSetDATA.count)")
                
            }
            .store(in: &cancellables)
    }
        
     
}


/*
 .filter({ $0.set == "THE_BARRENS" && $0.cardClass == "NEUTRAL" && $0.cardClass == "DEMONHUNTER" && $0.cardClass == "DRUID" && $0.cardClass == "HUNTER" && $0.cardClass == "MAGE" && $0.cardClass == "PRIEST" && $0.cardClass == "WARLOCK" && $0.cardClass == "ROGUE" && $0.cardClass == "SHAMAN" && $0.cardClass == "WARRIOR" && $0.cardClass == "PALADIN" && $0.cardClass == "ROGUE"})
 */



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
