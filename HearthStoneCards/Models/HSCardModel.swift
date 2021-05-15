//
//  HSCardModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct HSCardModel: Identifiable, Codable {
    let id: String
    let name: String?
    let rarity: String?
    let set: String?
    let type: String?
    let cardClass: String?
    let artist: String?
    let attack: Int?
    let collectible: Bool?
    let cost: Int?
    let dbfId: Int?
    let faction: String?
    let flavor: String?
    let health: Int?
    let mechanics: [String]?
    let race: String?
    let referencedTags: [String]?
    let text: String?
    var cardBackIMG: CardBackIMG?
    var cardImageURL: String {
        let urlString = "https://art.hearthstonejson.com/v1/render/latest/enUS/512x/\(id).png"
        return urlString
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case rarity
        case set
        case type
        case cardClass
        case artist
        case attack
        case collectible
        case cost
        case dbfId
        case faction
        case flavor
        case health
        case mechanics
        case race
        case referencedTags
        case text
        case cardBackIMG
    }
    
    init(cardImageURL: String, cardBackIMG: CardBackIMG, from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        rarity = try values.decodeIfPresent(String.self, forKey: .rarity) ?? ""
        set = try values.decodeIfPresent(String.self, forKey: .set) ?? ""
        type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
        cardClass = try values.decodeIfPresent(String.self, forKey: .cardClass) ?? ""
        artist = try values.decodeIfPresent(String.self, forKey: .artist) ?? ""
        attack = try values.decodeIfPresent(Int.self, forKey: .attack) ?? 0
        collectible = try values.decodeIfPresent(Bool.self, forKey: .collectible) ?? false
        cost = try values.decodeIfPresent(Int.self, forKey: .cost) ?? 0
        dbfId = try values.decodeIfPresent(Int.self, forKey: .dbfId) ?? 0
        faction = try values.decodeIfPresent(String.self, forKey: .faction) ?? ""
        flavor = try values.decodeIfPresent(String.self, forKey: .flavor) ?? ""
        health = try values.decodeIfPresent(Int.self, forKey: .health) ?? 0
        mechanics = try values.decodeIfPresent([String].self, forKey: .mechanics) ?? [""]
        race = try values.decodeIfPresent(String.self, forKey: .race) ?? ""
        referencedTags = try values.decodeIfPresent([String].self, forKey: .referencedTags) ?? [""]
        text = try values.decodeIfPresent(String.self, forKey: .text) ?? ""
        self.cardBackIMG = HSCardModel.CardBackIMG(rawValue: try values.decodeIfPresent(String.self, forKey: .cardBackIMG) ?? "")!
        }
  
    
    enum CardBackIMG: String, Codable {
        case classic
        case pandaria
        case blackTemple
        case karazhanNightsOneNightInKarazhan
        case fossilJourneyToUnGoro
        case eyesofCThunWispersOfTheOldGods
        case theGandTournament
        case blackrockMountainMoltenCore
        case THE_BARRENS
    }
}
