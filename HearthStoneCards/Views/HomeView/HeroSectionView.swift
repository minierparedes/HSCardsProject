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
            ForEach(0..<3) {item in
                VStack(alignment: .leading) {
                    Text("Standard Bundle")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Hello World")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                    Image("news\(item)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Color.black.opacity(0.2))
                        .frame(width: 370, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .frame(maxWidth: .infinity)
                
              
            }
        }
        .frame(height: 350)
        .padding(.top, 30)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        
        
        
       
    }
}

struct HeroSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSectionView()
    }
}
