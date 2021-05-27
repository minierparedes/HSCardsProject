//
//  HSCardCategoryViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/23.
//

import Combine
import SwiftUI

class HSCardCategoryViewModel: Identifiable, ObservableObject {
    @Published var theBarrensCardSetDATA: [HSCardModel] = []
    @Published var groupedCardClasses = [[HSCardModel]]()
    
    
    var cancellables = Set<AnyCancellable>()
    
    let dataService = HSCardsModelDataService.hsCardsModelDataServiceInstance
    
    init() {
        addSubscribers()
        groupCardClasses()
    }
    
    func addSubscribers() {
        dataService.$hsCardsModelData
            .sink { [weak self] (receivedHSCardModel) in
                self?.theBarrensCardSetDATA = receivedHSCardModel
                    .compactMap({ $0 })
                    .filter({ $0.set == "THE_BARRENS" && $0.name != "???" })
                    
                print("*****\n cardCategoryData \n***** element count: \(self?.theBarrensCardSetDATA.count)")
                print("*****\n cardCategoryData \n***** elements: \(self?.theBarrensCardSetDATA)")
            }
            .store(in: &cancellables)
    }
        
     func groupCardClasses() {
        let groupedClassesDictionary = Dictionary(grouping: theBarrensCardSetDATA) { (elementCardClass) -> String in
            return elementCardClass.cardClass ?? ""
        }
        
        let keys = groupedClassesDictionary.keys.sorted()
        keys.forEach { (key) in
            groupedCardClasses.append(groupedClassesDictionary[key]!)
        }
    }
}


/*
 .filter({ $0.set == "THE_BARRENS" && $0.cardClass == "NEUTRAL" && $0.cardClass == "DEMONHUNTER" && $0.cardClass == "DRUID" && $0.cardClass == "HUNTER" && $0.cardClass == "MAGE" && $0.cardClass == "PRIEST" && $0.cardClass == "WARLOCK" && $0.cardClass == "ROGUE" && $0.cardClass == "SHAMAN" && $0.cardClass == "WARRIOR" && $0.cardClass == "PALADIN" && $0.cardClass == "ROGUE"})
 */
