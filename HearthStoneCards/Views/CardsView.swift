//
//  CardsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct CardsView: View {
    @StateObject var hscardsVM: HSCardsViewModel = HSCardsViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(hscardsVM.hsCardsData) {card in
                    VStack {
                        CardCellView(cardModel: card)
                    }
                }
            }
                .navigationTitle("Cards")
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
