//
//  AshesOfOutlandCardsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/30.
//

import SwiftUI

struct AshesOfOutlandCardsView: View {
    @StateObject var hsCardsVM: HSCardsViewModel = HSCardsViewModel()
    var dictionaryGroup: [String: [HSCardModel]] {
        Dictionary(grouping: hsCardsVM.blackTempleCardSetDATA, by: { $0.cardClass ?? "N/A" })
    }
    var uniq: [String] {
        dictionaryGroup.map({ $0.key }).sorted()
    }
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 200), spacing: 6),
        GridItem(.adaptive(minimum: 200), spacing: 6)
    ]
    var body: some View {
        ScrollView {
            Image("ashesOfOutlands")
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

struct AshesOfOutlandCardsView_Previews: PreviewProvider {
    static var previews: some View {
        AshesOfOutlandCardsView()
    }
}
