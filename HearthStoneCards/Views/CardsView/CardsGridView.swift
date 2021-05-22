//
//  CardsGridView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/22.
//

import SwiftUI

struct CardsGridView: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 15, alignment: nil),
        GridItem(.flexible(), spacing: 15, alignment: nil)
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: nil,
                pinnedViews: [],
                content: {
                    ForEach(0..<30) {card in
                        RoundedRectangle(cornerRadius: 18)
                            .frame(height: 250)
                    }            })
                .padding()
        }
    }
}

struct CardsGridView_Previews: PreviewProvider {
    static var previews: some View {
        CardsGridView()
    }
}
