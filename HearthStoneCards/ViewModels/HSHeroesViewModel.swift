//
//  HSHeroesViewModel.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/10.
//

import SwiftUI

class HSHeroesViewModel: ObservableObject {
    @Published var heroes: [HSHeroModel] = []
    
    init() {
        getHeroes()
    }
    
    func getHeroes() {
        let demonHunter = HSHeroModel(id: 0, offset: 0, name: "Demon Hunter", characterIMG: "demonHunter", iconIMG: "Class_DemonHunter", classBadge: "demonhunterBadge")
        let paladin = HSHeroModel(id: 1, offset: 0, name: "Paladin", characterIMG: "paladin", iconIMG: "Class_Paladin", classBadge: "paladinBadge")
        let hunter = HSHeroModel(id: 2, offset: 0, name: "Hunter", characterIMG: "hunter", iconIMG: "Class_Hunter", classBadge: "hunterBadge")
        let druid = HSHeroModel(id: 3, offset: 0, name: "Druid", characterIMG: "druid", iconIMG: "Class_Druid", classBadge: "druidBadge")
        let mage = HSHeroModel(id: 4, offset: 0, name: "Mage", characterIMG: "mage", iconIMG: "Class_Mage", classBadge: "mageBadge")
        let priest = HSHeroModel(id: 5, offset: 0, name: "Priest", characterIMG: "priest", iconIMG: "Class_Priest", classBadge: "priestBadge")
        let rogue = HSHeroModel(id: 6, offset: 0, name: "Rogue", characterIMG: "rogue", iconIMG: "Class_Rogue", classBadge: "rogueBadge")
        let shaman = HSHeroModel(id: 7, offset: 0, name: "Shaman", characterIMG: "shaman", iconIMG: "Class_Shaman", classBadge: "shamanBadge")
        let warlock = HSHeroModel(id: 8, offset: 0, name: "Warlock", characterIMG: "warlock", iconIMG: "Class_Warlock", classBadge: "warlockBadge")
        let warrior = HSHeroModel(id: 9, offset: 0, name: "Warrior", characterIMG: "warrior", iconIMG: "Class_Warrior", classBadge: "warriorBadge")
        
        heroes.append(demonHunter)
        heroes.append(paladin)
        heroes.append(hunter)
        heroes.append(druid)
        heroes.append(mage)
        heroes.append(priest)
        heroes.append(rogue)
        heroes.append(shaman)
        heroes.append(warlock)
        heroes.append(warrior)
    }
    
    func calculateWidth() -> CGFloat {
        //horizontal padding 30
        let screen = UIScreen.main.bounds.width - 50
        //going to show first 3 cards, remaining cards will be hidden
        //2nd and 3rd cards will be moved to x axis with 30 value..
        let width = screen - (2 * 30)
        return width
    }
}
