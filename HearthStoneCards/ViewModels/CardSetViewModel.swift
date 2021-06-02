//
//  CardSetViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/06/02.
//

import Foundation

class CardSetViewModel: ObservableObject {
    @Published var cardSetData: [CardSetsModel] = []
    @Published var show: Bool = false
    
    init() {
        getCardSetData()
    }
    
    func getCardSetData() {
        cardSetData = [
            CardSetsModel(title: "Curse of Naxxramas", yearOfTitle: "Years 1 & 2 (2014-2015)", contentIMG: "curseOfNaxxramas", yearOfIcon: "years1and2", formatTitle: "Wild Format"),
            CardSetsModel(title: "Goblins vs Gnomes", yearOfTitle: "Years 1 & 2 (2014-2015)", contentIMG: "goblins_vs_gnomes2", yearOfIcon: "years1and2", formatTitle: "Wild Format"),
            CardSetsModel(title: "Blackrock Mountain", yearOfTitle: "Years 1 & 2 (2014-2015)", contentIMG: "blackrockMountain", yearOfIcon: "years1and2", formatTitle: "expansion"),
            CardSetsModel(title: "The Grand Tournamnet", yearOfTitle: "Years 1 & 2 (2014-2015)", contentIMG: "theGrandTournament", yearOfIcon: "years1and2", formatTitle: "Wild Format"),
            CardSetsModel(title: "The League of Explorers", yearOfTitle: "Years 1 & 2 (2014-2015)", contentIMG: "theLeagueOfExplorers", yearOfIcon: "years1and2", formatTitle: "expansion"),
            CardSetsModel(title: "Whispers of the Old Gods", yearOfTitle: "Year of the Kraken (2016)", contentIMG: "whispersOfTheOldGods", yearOfIcon: "yearOfTheKraken", formatTitle: "Wild Format"),
            CardSetsModel(title: "One Night in Karazhan", yearOfTitle: "Year of the Kraken (2016)", contentIMG: "oneNightInKarazhan", yearOfIcon: "yearOfTheKraken",  formatTitle: "expansion"),
            CardSetsModel(title: "Mean Streets of Gadgetza", yearOfTitle: "Year of the Kraken (2016)", contentIMG: "meanStreetsOfGadgetzan2", yearOfIcon: "yearOfTheKraken", formatTitle: "Wild Format")
        ]
    }
}
