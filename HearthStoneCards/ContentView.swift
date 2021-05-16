//
//  ContentView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Text("Home")
                Image("tabIconHS_Classic26x26")
                    
                }
            CardsView()
            .tabItem {
                Text("Cards")
                Image(systemName: "square.stack.3d.down.right")
                }
            CardSetsView()
            .tabItem {
                Text("Card Sets")
                Image(systemName: "square.stack.3d.up")
                }
            SearchView()
            .tabItem {
                Text("Search")
                Image(systemName: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
