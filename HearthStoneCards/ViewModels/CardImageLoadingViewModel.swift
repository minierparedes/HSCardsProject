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
    let manager = HSCardModelImageCacheManager.instance
    
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            cardImage = savedImage
            print("Getting saved cardImage!")
        } else {
            fetCardImages()
            print("CardImage VM: Downloading image now!")
        }
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
                guard let self = self,
                      let image = receivedImage else { return }
                self.cardImage = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)

    }
}
