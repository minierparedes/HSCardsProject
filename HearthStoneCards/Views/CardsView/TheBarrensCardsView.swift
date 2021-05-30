//
//  CardsGridView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/22.
//

import SwiftUI

struct TheBarrensCardsView: View {
    @StateObject var hsCardsVM: HSCardsViewModel = HSCardsViewModel()
    var dictionaryGroup: [String: [HSCardModel]] {
        Dictionary(grouping: hsCardsVM.theBarrensCardSetDATA, by: { $0.cardClass! })
    }
    var uniq: [String] {
        dictionaryGroup.map({ $0.key }).sorted()
    }
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    var body: some View {
        ScrollView {
            Rectangle()
                .overlay(Image("Forged_in_the_Barrens_banner")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 450, height: 200))
                .frame(height: 200)
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
        TheBarrensCardsView()
    }
}
