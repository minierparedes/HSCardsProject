//
//  CardSetListView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/06/01.
//

import SwiftUI

struct CardSetListView: View {
    @State var cardSetVM: CardSetViewModel = CardSetViewModel()
    var body: some View {
        ScrollView {
            ForEach(cardSetVM.cardSetData) {cardset in
                CardSetCellView(cardset: cardset)
            }
        }
    }
}

struct CardSetListView_Previews: PreviewProvider {
    static var previews: some View {
        CardSetListView()
    }
}
