//
//  CardsGridView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/22.
//

import SwiftUI

struct CardsGridView: View {
    @StateObject var hsCardCategoryVM: HSCardCategoryViewModel = HSCardCategoryViewModel()
    var dictionaryGroup: [String: [HSCardModel]] {
        Dictionary(grouping: hsCardCategoryVM.cardCategoryData, by: { $0.cardClass! })
    }
    var uniq: [String] {
        dictionaryGroup.map({ $0.key }).sorted()
    }
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.purple)
                .frame(height: 250)
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: nil,
                pinnedViews: [.sectionHeaders],
                content: {
                    ForEach(uniq, id: \.self) { section in
                        Section(header:
                                    SectionHeaderView(sectionTitle: section, sectionBadge: section)
                        ) {
                            ForEach(dictionaryGroup[section]!) {card in
                                CardCellView(cardModel: card)
                            }
                        }
                    }
            })
        }
    }
}

struct CardsGridView_Previews: PreviewProvider {
    static var previews: some View {
        CardsGridView()
    }
}
