//
//  ImageViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/13.
//

import SwiftUI
import Combine

class CardImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellable = Set<AnyCancellable>()
    
    let imgURLString: String
    
    
    init(imgURL: String) {
        imgURLString = imgURL
        fetchImages()
    }
    

    func fetchImages() {
        isLoading = true
        guard let url = URL(string: imgURLString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                print("Image ViewModel Recieved Data: \(self?.image)")
                
            }
            .store(in: &cancellable)
        }

    func getCardBackImg(_ cardBackIMG: HSCardModel.CardBackIMG) -> CardBacksIMG {
        switch cardBackIMG {
        case .classic:
            return CardBacksIMG.classic
        case .pandaria:
            return CardBacksIMG.pandaria
        case .blackTemple:
            return CardBacksIMG.blackTemple
        case .karazhanNightsOneNightInKarazhan:
            return CardBacksIMG.karazhanNightsOneNightInKarazhan
        case .fossilJourneyToUnGoro:
            return CardBacksIMG.fossilJourneyToUnGoro
        case .eyesofCThunWispersOfTheOldGods:
            return CardBacksIMG.eyesofCThunWispersOfTheOldGods
        case .theGandTournament:
            return CardBacksIMG.theGandTournament
        case .blackrockMountainMoltenCore:
            return CardBacksIMG.blackrockMountainMoltenCore
        case .THE_BARRENS:
            return CardBacksIMG.hamuulForgedInTheBarrens
        }
    }
    
  
}
