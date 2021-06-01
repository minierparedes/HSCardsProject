//
//  TheGrandTournamentCardsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/29.
//

import SwiftUI

struct TheGrandTournamentCardsView: View {
    @StateObject var hsCardsVM: HSCardsViewModel = HSCardsViewModel()
    var dictionaryGroup: [String: [HSCardModel]] {
        Dictionary(grouping: hsCardsVM.tgtCardSetDATA, by: { $0.cardClass ?? "N/A" })
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
            Image("demonHunterInitiate")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
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

struct TheGrandTournamentCardsView_Previews: PreviewProvider {
    static var previews: some View {
        TheGrandTournamentCardsView()
    }
}
