//
//  CardImageCellView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/13.
//

import SwiftUI

struct CardImageCellView: View {
    @StateObject var cardImgVM: CardImageViewModel
    let cardBack: HSCardModel.CardBackIMG
    init(url: String, cardBack: HSCardModel.CardBackIMG) {
        _cardImgVM = StateObject(wrappedValue: CardImageViewModel(imgURL: url))
        self.cardBack = cardBack
    }
    var body: some View {
        ZStack {
            if cardImgVM.isLoading {
                ProgressView()
            } else if let img = cardImgVM.image {
                CardFlipView(front: {Image(uiImage: img).resizable().frame(width: 250, height: 270)}, back: {cardImgVM.getCardBackImg(HSCardModel.CardBackIMG(rawValue: cardBack.rawValue)!)})
                
               
            }
        }
    }
}

struct CardImageCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageCellView(url: "https://art.hearthstonejson.com/v1/render/latest/enUS/256x/EX1_001.png", cardBack: .blackTemple)
            .frame(width: 250, height: 260)
            .previewLayout(.sizeThatFits)
    }
}
