//
//  CardSetListView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/06/01.
//

import SwiftUI

struct CardSetListView: View {
    @State var cardSetVM = CardSetViewModel()
    @EnvironmentObject var cardsetVM: CardSetViewModel
    var namespace: Namespace.ID
    var body: some View {
        ScrollView {
            ForEach(cardSetVM.cardSetData) {cardset in
                CardSetCellView(cardset: cardset, namespace: namespace)
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                            cardsetVM.selectedCardset = cardset
                            cardsetVM.isShowing.toggle()
                        }
                    }
            }
        }
    }
}

//struct CardSetListView_Previews: PreviewProvider {
//    @State static var namespace: Namespace
//    static var previews: some View {
//        CardSetListView( namespace: namespace)
//    }
//}
