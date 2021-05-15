//
//  LatestCardsSetSectionView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/08.
//

import SwiftUI

struct LatestCardsSetSectionView: View {
    @StateObject var hsCardsVM: HSCardsViewModel = HSCardsViewModel()
    var body: some View {
        List {
            ForEach(hsCardsVM.latestCardSets) {card in
                CardCellView(cardModel: card)
                Text(card.set!)
            }
        }
    }
}

struct LatestCardsSetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        LatestCardsSetSectionView()
    }
}


/*
 CardFlipView(front: {Image("card\(item)").resizable().aspectRatio(contentMode: .fit)}, back: {Image("card5").resizable().aspectRatio(contentMode: .fit)})
 */


/*
 HStack {
     HStack {
         ForEach(hsCardsVM.latestCardSets) {card in
             CardCellView(cardModel: card)
                 
                 
         }
     }
     .modifier(ScrollingHStackModifier(items: hsCardsVM.latestCardSets.count, itemWidth: 200, itemSpacing: 15))
 }
 .frame(width: 370, height: 300, alignment: .center)
 */
