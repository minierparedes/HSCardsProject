//
//  CardSetModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/06/02.
//

import Foundation


struct CardSetsModel: Identifiable {
    var id = UUID().uuidString
    var title: String
    var yearOfTitle: String
    var contentIMG: String
    var yearOfIcon: String
    var formatTitle: String
}
