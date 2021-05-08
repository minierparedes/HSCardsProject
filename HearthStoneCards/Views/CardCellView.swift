//
//  CardCellView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/08.
//

import SwiftUI

struct CardCellView: View {
    //let card: HSCardModel
    var body: some View {
        CardFlipView(front: {Image("card1")}, back: {Image("card6")})
    }
}



struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardCellView()
    }
}
