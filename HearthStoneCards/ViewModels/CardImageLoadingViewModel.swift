//
//  CardImageLoadingViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/24.
//

import Combine
import Foundation
import SwiftUI

class CardImageLoadingViewModel: ObservableObject {
    @Published var cardImage: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    let urlString: String
    
    init(url: String) {
        urlString = url
        fetCardImages()
    }
    
    func fetCardImages() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, response) -> UIImage? in
                return UIImage(data: data)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] ( _ ) in
                self?.isLoading = false
            } receiveValue: { [weak self] (receivedImage) in
                self?.cardImage = receivedImage
            }
            .store(in: &cancellables)

    }
}
