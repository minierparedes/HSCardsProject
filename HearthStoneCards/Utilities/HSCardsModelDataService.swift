//
//  HSCardsModelDataService.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import Combine
import Foundation


class HSCardsModelDataService {
    static let hsCardsModelDataServiceInstance = HSCardsModelDataService()//Singleton
    
    @Published var hsCardsModelData: [HSCardModel] = []
    @Published var isLoadingDataService: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://api.hearthstonejson.com/v1/81706/enUS/cards.json") else { return }
        isLoadingDataService = true
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [HSCardModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            } receiveValue: { [weak self](receivedHSCardModel) in
                self!.isLoadingDataService = false
                self?.hsCardsModelData = receivedHSCardModel
            }
            .store(in: &cancellables)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
