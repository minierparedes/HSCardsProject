//
//  HomeView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct HomeView: View {
    @StateObject var hsCardsVM: HSCardsViewModel = HSCardsViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HeroSectionView()
                    
                    Text("Hello world")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
            }
            .navigationTitle("HearthStone")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


/*
 if hsCardsVM.isLoading {
 ProgressView()
 .progressViewStyle(CircularProgressViewStyle())
 }
 */


