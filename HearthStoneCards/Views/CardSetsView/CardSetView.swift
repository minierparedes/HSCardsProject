//
//  CardSetView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/06/02.
//

import SwiftUI

struct CardSetView: View {
    @Namespace var namespace
    @StateObject var cardsetVM = CardSetViewModel()
    var body: some View {
        NavigationView {
            
            ZStack {
                
               CardSetListView(namespace: namespace)
                .environmentObject(cardsetVM)
                .zIndex(1.0)
                
                if cardsetVM.isShowing {
                    CardSetsDetailView(cardsetVM: cardsetVM, namespace: namespace)
                        .zIndex(2)
                        
                        
                }
                
            
            }   .navigationTitle("Card Sets")
        }
    }
}

struct CardSetView_Previews: PreviewProvider {
    static var previews: some View {
        CardSetView()
    }
}

