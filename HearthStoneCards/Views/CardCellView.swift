//
//  CardCellView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/24.
//

import SwiftUI

struct CardCellView: View {
    let cardModel: HSCardModel
    var body: some View {
        CardImageView(url: cardModel.cardImageURL, key: cardModel.id)
    }
}


