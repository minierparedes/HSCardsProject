//
//  CurseOfNaxxramasCardsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/29.
//

import SwiftUI

struct CurseOfNaxxramasCardsView: View {
    @StateObject var hsCardsVM: HSCardsViewModel = HSCardsViewModel()
    var dictionaryGroup: [String: [HSCardModel]] {
        Dictionary(grouping: hsCardsVM.naxxCardSetDATA, by: { $0.cardClass ?? "N/A" })
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
                .overlay(Image("Year_of_the_Gryphon_banner")
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

struct CurseOfNaxxramasCardsView_Previews: PreviewProvider {
    static var previews: some View {
        CurseOfNaxxramasCardsView()
    }
}
