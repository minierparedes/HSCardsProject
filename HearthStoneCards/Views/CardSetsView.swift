//
//  CardSetsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct CardSetsView: View {
    var body: some View {
        NavigationView {
            LatestCardsSetSectionView()
                .navigationTitle("Card Sets")
        }
    }
}

struct CardSetsView_Previews: PreviewProvider {
    static var previews: some View {
        CardSetsView()
    }
}
