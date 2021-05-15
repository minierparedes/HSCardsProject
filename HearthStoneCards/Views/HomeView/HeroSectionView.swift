//
//  HeroSectionView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/08.
//

import SwiftUI

struct HeroSectionView: View {
    var body: some View {
        TabView{
            ForEach(0..<5) {item in
                HStack {
                    VStack(alignment: .leading) {
                        Text("Standard Bundle Available Now")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text("Hello World")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Image("news\(item)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 390, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .frame(width: 380)
                }
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: 350)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct HeroSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSectionView()
    }
}
