//
//  MadnessAtTheDarkmoonFaireView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/27.
//

import SwiftUI

struct DarkmoonFaireCardsView: View {
    @StateObject var hsCardsVM: HSCardsViewModel = HSCardsViewModel()
    var dictionaryGroup: [String: [HSCardModel]] {
        Dictionary(grouping: hsCardsVM.darkmoonFaireCardSetDATA, by: { $0.cardClass ?? "" })
    }
    var mappedGroupedCardElements: [String] {
        dictionaryGroup.map({ $0.key }).sorted()
    }
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    var body: some View {
        ScrollView {
            Image("Madness_at_the_Darkmoon_Faire_banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: nil,
                pinnedViews: [.sectionHeaders],
                content: {
                    ForEach(mappedGroupedCardElements, id: \.self) { section in
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

struct MadnessAtTheDarkmoonFaireView_Previews: PreviewProvider {
    static var previews: some View {
        DarkmoonFaireCardsView()
    }
}
