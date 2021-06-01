//
//  CardSetsDetailView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/06/01.
//

import SwiftUI

struct CardSetsDetailView: View {
    @State var isAppear: Bool = false
    let multiLineText: String = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
    var namespace: Namespace.ID
    var body: some View {
        ScrollView {
            VStack() {
               Image("curseOfNaxxramas")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .matchedGeometryEffect(id: "cardSetBanner", in: namespace)
                .frame(width: UIScreen.main.bounds.width)
                
                
                HStack {
                    Image("classicIcon")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 36, height: 36)
                    VStack(alignment: .leading) {
                        Text("Years 1 & 2 (2014 - 2015)")
                            .fontWeight(.bold)
                            
                        Text("Wild Format")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .matchedGeometryEffect(id: "hcontainer", in: namespace)
                .frame(maxWidth: .infinity)
                .padding(14)
                .background(Color.secondary.opacity(0.6))
            }
            .frame(width: UIScreen.main.bounds.width, height: 435)
            .mask(
                RoundedRectangle(cornerRadius: 0)
                    .matchedGeometryEffect(id: "shape", in: namespace)
            )
            .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 10)
            
            ScrollView {
                Text(multiLineText)
                    .padding()
                    .animation(.spring(response: 0.8, dampingFraction: 0.7))
                    .offset(y:  isAppear ? 0 : 370)
                    .onAppear {
                        isAppear = true
                    }
                    .onDisappear {
                        isAppear = false
                }
            }
           Spacer()
        }
        .ignoresSafeArea()
    }
}

struct CardSetsDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CardSetsDetailView(namespace: namespace)
    }
}
