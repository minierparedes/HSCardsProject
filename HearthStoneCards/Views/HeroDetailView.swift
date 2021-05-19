//
//  HeroDetailView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/19.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: HSHeroModel
    let heroText: String = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
"""
    var body: some View {
        VStack {
           
            Image(hero.characterIMG)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(
                    Image(hero.iconIMG)
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 55, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).offset(y: 160)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                )
                .frame(width: UIScreen.main.bounds.width, height: 450)
                           // )
                .clipped()
            
            ScrollView {
                VStack {
                    
                    Text(hero.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding()
                    Text(heroText)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailView(hero: HSHeroModel(id: 9, offset: 0, name: "Warrior", characterIMG: "warrior", iconIMG: "Class_Warrior"))
            
            
            
    }
}