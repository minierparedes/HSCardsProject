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
    init(url: String, cardBack: HSCardModel.CardBackIMG, key: String) {
        _cardImgVM = StateObject(wrappedValue: CardImageViewModel(imgURL: url, key: key))
        self.cardBack = cardBack
    }
    var body: some View {
        ZStack {
            if cardImgVM.isLoading {
                ProgressView()
            } else if let img = cardImgVM.image {
                CardFlipView(front: {Image(uiImage: img).resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 250)}, back: {cardImgVM.getCardBackImg(HSCardModel.CardBackIMG(rawValue: cardBack.rawValue)!).frame(width: 135, height: 190).offset(x: -3, y: -3)})
               
            }
        }
    }
}

struct CardImageCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageCellView(url: "https://art.hearthstonejson.com/v1/render/latest/enUS/256x/EX1_001.png", cardBack: .blackTemple, key: "1")
            .frame(width: 250, height: 260)
            .previewLayout(.sizeThatFits)
    }
}
