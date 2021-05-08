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
    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    let dataService = HSCardsModelDataService.hsCardsModelDataServiceInstance
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        isLoading = dataService.isLoadingDataService 
        dataService.$hsCardsModelData
            .sink { [weak self] (receivedHSCardModel) in
                self?.hsCardsData = receivedHSCardModel
            }
            .store(in: &cancellables)
    }
}
