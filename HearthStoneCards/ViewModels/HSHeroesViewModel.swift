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
        let demonHunter = HSHeroModel(id: 0, offset: 0, name: "Demon Hunter", characterIMG: "demonHunter")
        let paladin = HSHeroModel(id: 1, offset: 0, name: "Paladin", characterIMG: "paladin")
        let hunter = HSHeroModel(id: 2, offset: 0, name: "Hunter", characterIMG: "hunter")
        let druid = HSHeroModel(id: 3, offset: 0, name: "Druid", characterIMG: "druid")
        let mage = HSHeroModel(id: 4, offset: 0, name: "Mage", characterIMG: "mage")
        let priest = HSHeroModel(id: 5, offset: 0, name: "Priest", characterIMG: "priest")
        let rogue = HSHeroModel(id: 6, offset: 0, name: "Rogue", characterIMG: "rogue")
        let shaman = HSHeroModel(id: 7, offset: 0, name: "Shaman", characterIMG: "shaman")
        let warlock = HSHeroModel(id: 8, offset: 0, name: "Warlock", characterIMG: "warlock")
        let warrior = HSHeroModel(id: 9, offset: 0, name: "Warrior", characterIMG: "warrior")
        
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
