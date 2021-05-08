//
//  HeroSectionView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/08.
//

import SwiftUI

struct HeroSectionView: View {
    var body: some View {
        TabView {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hello world")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Hello world and stuff")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                }
            }.padding()
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 270)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct HeroSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSectionView()
    }
}
