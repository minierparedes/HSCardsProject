//
//  CardSetsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct CardSetCellView: View {
    var cardset: CardSetsModel
    var namespace: Namespace.ID
    var body: some View {
 
        ZStack {
            VStack {
                    Image(cardset.contentIMG)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .matchedGeometryEffect(id: cardset.contentIMG, in: namespace)
                    .frame(width: UIScreen.main.bounds.width - 20)
                    
                    
                    HStack {
                        Image(cardset.yearOfIcon)
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 36, height: 36)
                        VStack(alignment: .leading) {
                            Text(cardset.yearOfTitle)
                                .fontWeight(.bold)
                            Text(cardset.formatTitle)
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                    .matchedGeometryEffect(id: cardset.id, in: namespace)
                    .frame(maxWidth: .infinity)
                    .padding(14)
                    .background(Color.secondary.opacity(0.6))
                }
                
                .frame(width: UIScreen.main.bounds.width - 20, height: 335)
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        
                )
                .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 10)
            .padding(20)
        }
        
    }
}

struct CardSetsView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CardSetCellView(cardset: CardSetsModel(title: "curse of Naxxramas", yearOfTitle: "Years 1 & 2 (2014-2015)", contentIMG: "curseOfNaxxramas", yearOfIcon: "years1and2", formatTitle: "Wild Format"), namespace: namespace)
    }
}


/*
 

 */
