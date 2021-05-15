//
//  HeroClassSectionView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/08.
//

import SwiftUI

struct HeroClassSectionView: View {
    @StateObject var heroesVM: HSHeroesViewModel = HSHeroesViewModel()
    @State var didSlide: Bool = false
    @State var isScrolled = 0
    var body: some View {
        ZStack {
            ForEach(heroesVM.heroes.reversed()) {hero in
                HStack {
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                        Image(hero.characterIMG)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: heroesVM.calculateWidth(), height: (UIScreen.main.bounds.height / 1.8) - CGFloat(hero.id - isScrolled) * 50)//dynamic frame
                            .cornerRadius(15)
                            
                        VStack(alignment: .leading, spacing: 18) {
                            Text(hero.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Button(action: {}) {
                                Text("button")
                            }
                        }
                        .frame(width: heroesVM.calculateWidth() - 40)
                        .padding(.leading, 40)
                        .padding(.bottom, 40)
                    }
                    .offset(x: hero.id - isScrolled <= 2 ? CGFloat(hero.id - isScrolled) * 30 : 60)
                    Spacer(minLength: 0)
                }
                .contentShape(Rectangle())
                .offset(x: hero.offset)
                .gesture(DragGesture().onChanged({(value) in
                    withAnimation {
                        if value.translation.width < 0 && hero.id != heroesVM.heroes.last!.id {
                            heroesVM.heroes[hero.id].offset = value.translation.width
                        }else {
                            //restoring cards
                            if hero.id > 0 {
                                heroesVM.heroes[hero.id - 1].offset = -(heroesVM.calculateWidth() + 60) + value.translation.width
                            }
                        }
                    }
                }).onEnded({(value) in
                    withAnimation {
                        if value.translation.width < 0 {
                            if -value.translation.width > 180  && hero.id != heroesVM.heroes.last!.id {
                                heroesVM.heroes[hero.id].offset = -(heroesVM.calculateWidth() + 60)
                                isScrolled += 1
                            }else {
                                heroesVM.heroes[hero.id].offset = 0
                            }
                        }else {
                            //restoring card
                            if hero.id > 0 {
                                if value.translation.width > 180 {
                                    heroesVM.heroes[hero.id - 1].offset = 0
                                    isScrolled -= 1
                                }else {
                                    heroesVM.heroes[hero.id - 1].offset = -(heroesVM.calculateWidth() + 60)
                                   
                                }
                            }
                        }
                    }
                }))
                
            }
        }
        .frame(height: UIScreen.main.bounds.height / 1.8)//max height
        .padding(.horizontal, 20)
        .padding(.top, 25)
    }
}

struct HeroClassSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeroClassSectionView()
    }
}
