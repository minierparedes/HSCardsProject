//
//  SearchView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            CardBacksIMG.pandaria
                .aspectRatio(contentMode: .fit)
                .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
