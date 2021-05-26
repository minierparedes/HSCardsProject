//
//  HSCardCategoryViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/23.
//

import Combine
import SwiftUI

class HSCardCategoryViewModel: Identifiable, ObservableObject {
    @Published var cardCategoryData: [HSCardModel] = []
    @Published var demonHunterClass: [HSCardModel] = []
    @Published var druidClass: [HSCardModel] = []
    @Published var hunterClass: [HSCardModel] = []
    @Published var mageClass: [HSCardModel] = []
    @Published var paladinClass: [HSCardModel] = []
    @Published var priestClass: [HSCardModel] = []
    @Published var rogueClass: [HSCardModel] = []
    @Published var shamanClass: [HSCardModel] = []
    @Published var warlockClass: [HSCardModel] = []
    @Published var warriorClass: [HSCardModel] = []
    @Published var neutralClass: [HSCardModel] = []
   
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
                self?.cardCategoryData = receivedHSCardModel.filter({ $0.set == "THE_BARRENS"})
            }
            .store(in: &cancellables)
    }
        
     func groupCardClasses() {
        let groupedClassesDictionary = Dictionary(grouping: cardCategoryData) { (elementCardClass) -> String in
            return elementCardClass.cardClass!
        }
        
        let keys = groupedClassesDictionary.keys.sorted()
        keys.forEach { (key) in
            groupedCardClasses.append(groupedClassesDictionary[key]!)
        }
        /*
        groupedCardClasses.forEach({
            $0.forEach({print($0)})
            print("----------------------------")
        })
         */
        print(groupedCardClasses)
    }
}
