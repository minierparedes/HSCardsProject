//
//  CardImageView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/24.
//

import SwiftUI

struct CardImageView: View {
    @StateObject var cardImageLoadingVM: CardImageLoadingViewModel
    
    init(url: String, key: String) {
        _cardImageLoadingVM = StateObject(wrappedValue: CardImageLoadingViewModel(url: url, key: key))
    }
    var body: some View {
        ZStack {
            if cardImageLoadingVM.isLoading {
                ProgressView()
                    .frame(width: 250, height: 250)
            } else if let image = cardImageLoadingVM.cardImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
            }
        }
    }
}

struct CardImageView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageView(url: "https://art.hearthstonejson.com/v1/render/latest/enUS/256x/EX1_001.png", key: "1")
            .previewLayout(.sizeThatFits)
    }
}
