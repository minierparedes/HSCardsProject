//
//  CardBacksIMG.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/14.
//

import SwiftUI

enum CardBacksIMG: String, View {
    case classic
    case pandaria
    case blackTemple
    case karazhanNightsOneNightInKarazhan
    case fossilJourneyToUnGoro
    case eyesofCThunWispersOfTheOldGods
    case theGandTournament
    case blackrockMountainMoltenCore
    case hamuulForgedInTheBarrens 
    
    var body: Image {
        Image(rawValue)
            .resizable()
    }
}
