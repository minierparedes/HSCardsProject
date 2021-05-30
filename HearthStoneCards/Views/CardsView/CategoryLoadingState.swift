//
//  CategoryLoadingState.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/30.
//

import SwiftUI

enum CategoryLoadingState {
    enum SelectedCategoryView: String, CaseIterable {
        case standardCardsView = "Standard"
        case wildCardsView = "Wild"
        case theBarrensCardsView = "Forged in the barrens"
        case classicCardsView = "Classic"
    }
    
   @ViewBuilder static func categoryLoader(optionSelected: SelectedCategoryView) -> some View {
        switch optionSelected {
        case .standardCardsView:
             StandardCardsView()
        case .wildCardsView:
             WildCardsView()
        case .theBarrensCardsView:
             TheBarrensCardsView()
        case .classicCardsView:
             Text("CLASSIC")
        }
    }
}
