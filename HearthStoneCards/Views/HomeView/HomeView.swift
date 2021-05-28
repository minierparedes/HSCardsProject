//
//  HomeView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/07.
//

import SwiftUI

struct HomeView: View {
    @StateObject var hsCardsVM: HSHomeViewModel = HSHomeViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HeroSectionView()
                    .padding(.bottom, 20)
                    
                
                Text("Discover")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .foregroundColor(.primary)
                    .padding(.bottom, 5)
                
                LatestCardsSetSectionView()
                    .padding()
                    
                
                Text("HearthStone Heroes")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .foregroundColor(.primary)
                    .padding(.bottom, 20)
                
                HeroClassSectionView()
            }
            .padding(.bottom, 50)
        }
        .navigationTitle("HearthStone")
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


