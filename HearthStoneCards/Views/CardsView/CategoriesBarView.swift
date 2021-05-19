//
//  CategoriesBarView.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/19.
//

import SwiftUI

struct CategoriesBarView: View {
    @State var isShowing: Bool = false
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<7) {category in
                    ZStack {
                        
                        Capsule()
                            .frame(width: 90, height: 50, alignment: .center)
                        Text("hello")
                            .foregroundColor(.white)
                    }.onTapGesture {
                        isShowing.toggle()
                    }
                    .sheet(isPresented: $isShowing, content: {
                        Text("Hello world")
                    })
                }
            }
        }
    }
}

struct CategoriesBarView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesBarView()
    }
}
