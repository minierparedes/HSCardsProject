//
//  CardCellView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/08.
//

import SwiftUI

struct CardCellView: View {
    let cardModel: HSCardModel
    var body: some View {
        VStack {
            CardImageCellView(url: cardModel.cardImageURL, cardBack: (HSCardModel.CardBackIMG(rawValue: cardModel.set!) ?? HSCardModel.CardBackIMG(rawValue: "classic"))!, key: cardModel.id)
                
                
        }
    }
}
//, cardBack: HSCardModel.CardBackIMG(rawValue: cardModel.cardBackIMG?.rawValue ?? "classic")!
//(CardBacksIMG(rawValue: cardModel.set!) ?? CardBacksIMG(rawValue: "classic"))!

/*
 HSCardModel(id: "1",
                                     name: "hello",
                                     rarity: "rare",
                                     set: "set",
                                     type: "type",
                                     cardClass: "cardClass",
                                     artist: "artist",
                                     attack: 1,
                                     collectible: true,
                                     cost: 1,
                                     dbfId: 1,
                                     faction: "faction",
                                     flavor: "flavor",
                                     health: 1,
                                     mechanics: ["mechanics"],
                                     race: "race",
                                     referencedTags: ["referencedTags"],
                                     text: "text",
                                     url: "url")
 */
