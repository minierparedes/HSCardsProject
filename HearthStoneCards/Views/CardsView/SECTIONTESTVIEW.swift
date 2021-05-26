//
//  SECTIONTESTVIEW.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/25.
//

import SwiftUI

struct TESTRow: View {
    let cardModel: HSCardModel
    var body: some View {
        Text(cardModel.name!)
    }
}

struct SECTIONTESTVIEW: View {
    @StateObject var hsCardCategoryVM = HSCardCategoryViewModel()
    var dictionaryGroup: [String: [HSCardModel]] {
        Dictionary(grouping: hsCardCategoryVM.cardCategoryData, by: { $0.cardClass! })
    }
    var uniq: [String] {
        dictionaryGroup.map({ $0.key }).sorted()
    }
    var body: some View {
        List {
            ForEach(uniq, id: \.self) { section in
                Section(header: Text(section)) {
                    ForEach(dictionaryGroup[section]!) {card in
                        TESTRow(cardModel: card)
                    }
                }
            }
        }
    }
}

struct SECTIONTESTVIEW_Previews: PreviewProvider {
    static var previews: some View {
        SECTIONTESTVIEW()
    }
}
