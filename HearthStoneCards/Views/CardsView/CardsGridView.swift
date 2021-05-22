//
//  CardsGridView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/22.
//

import SwiftUI

struct CardsGridView: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 250)
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section(header:
                                HStack {
                                    
                                    Text("Demon Hunter")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                    Image("Class_DemonHunter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.yellow)
                                        .frame(width: 50, height: 50)
                                    Spacer()
                                }
                    ) {
                        ForEach(0..<10) {card in
                            Image("card1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 240, height: 250)
                        }
                    }
                    
                    Section(header:
                                HStack {
                                    
                                    Text("Druid")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                    Image("Class_Druid_Alt")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.yellow)
                                        .frame(width: 50, height: 50)
                                    Spacer()
                                }
                    ) {
                        ForEach(0..<10) {card in
                            Image("card1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 240, height: 250)
                        }
                    }
                })
                .padding()
        }
    }
}

struct CardsGridView_Previews: PreviewProvider {
    static var previews: some View {
        CardsGridView()
    }
}
