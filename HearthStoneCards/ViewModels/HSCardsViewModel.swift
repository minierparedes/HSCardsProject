//
//  HSCardCategoryViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/23.
//

import Combine
import SwiftUI

class HSCardsViewModel: Identifiable, ObservableObject {
    @Published var theBarrensCardSetDATA: [HSCardModel] = []
    @Published var darkmoonFaireCardSetDATA: [HSCardModel] = []
    @Published var standardCardSetDATA: [HSCardModel] = []
   
    let standardCardSetNamesYear2021: [String] = ["BLACK_TEMPLE", "SCHOLOMANCE", "DARKMOON_FAIRE", "THE_BARRENS", "CORE"]
    
    var cancellables = Set<AnyCancellable>()
    
    let dataService = HSCardsModelDataService.hsCardsModelDataServiceInstance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$hsCardsModelData
            .sink { [weak self] (receivedHSCardModel) in
                self?.theBarrensCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "THE_BARRENS" && $0.name != "???" })
                self?.darkmoonFaireCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "DARKMOON_FAIRE" && $0.name != "???" })
                self?.standardCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ self!.standardCardSetNamesYear2021.contains($0.set ?? "") && $0.name != "???" })
                
                print("*****\n theBarrensCardSetDATA \n***** element count: \(self?.theBarrensCardSetDATA.count)")
                print("*****\n darkmoonFaireCardSetDATA \n***** element count: \(self?.darkmoonFaireCardSetDATA.count)")
                print("*****\n standardCardSetDATA \n***** element count: \(self?.standardCardSetDATA.count)")
                
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
