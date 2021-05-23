//
//  HSCardCategoryViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/23.
//

import Combine
import SwiftUI

class HSCardCategoryViewModel: ObservableObject {
    @Published var cardCategoryData: [HSCardModel] = []
    var cancellables = Set<AnyCancellable>()
    
    let dataService = HSCardsModelDataService.hsCardsModelDataServiceInstance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$hsCardsModelData
            .sink { [weak self] (receivedHSCardModel) in
                self?.cardCategoryData = receivedHSCardModel.filter({ $0.set == "THE_BARRENS"})
            }
            .store(in: &cancellables)
    }
}
