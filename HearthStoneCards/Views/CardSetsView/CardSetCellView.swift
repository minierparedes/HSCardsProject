//
//  CardSetsView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct CardSetCellView: View {
    @State var isShowing: Bool = false
    @Namespace var namespace
    var body: some View {
            ZStack {
                if isShowing == false {
                    VStack {
                        VStack {
                           Image("curseOfNaxxramas")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .matchedGeometryEffect(id: "cardSetBanner", in: namespace)
                            .frame(width: UIScreen.main.bounds.width - 20)
                            
                            
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
                        
                        .frame(width: UIScreen.main.bounds.width - 20, height: 335)
                        .mask(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .matchedGeometryEffect(id: "shape", in: namespace)
                        )
                        .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 10)
                    }
                    .padding(20)
                    
                } else {
                    CardSetsDetailView(namespace: namespace)
                        .statusBar(hidden: true)
                }
                
            }
            .animation(.spring(response: 0.3))
            .onTapGesture {
                isShowing.toggle()
            }
    }
}

struct CardSetsView_Previews: PreviewProvider {
    static var previews: some View {
        CardSetCellView()
            
            
            
            
    }
}
