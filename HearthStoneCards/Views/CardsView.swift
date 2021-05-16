//
//  CardsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        NavigationView {
            Text("All Cards")
                .navigationTitle("Cards")
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
