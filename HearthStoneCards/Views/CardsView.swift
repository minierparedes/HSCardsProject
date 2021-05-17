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
            ScrollView(.horizontal) {
                HStack(spacing: 60) {
                    ForEach(hscardsVM.latestCardSets) {card in
                        CardCellView(cardModel: card)
                            .frame(width: 150, height: 250)
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
