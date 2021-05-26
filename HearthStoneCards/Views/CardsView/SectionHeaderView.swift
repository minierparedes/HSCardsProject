//
//  SectionHeaderView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/24.
//

import SwiftUI

struct SectionHeaderView: View {
    var sectionTitle: String
    var sectionBadge: String
    
    var body: some View {
        HStack {
            
            Text(sectionTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            Image(sectionBadge)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.yellow)
                .frame(width: 50, height: 50)
            Spacer()
        }
    }
}
