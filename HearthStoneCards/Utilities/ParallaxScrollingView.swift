//
//  ParallaxScrollingVIew.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/13.
//

import SwiftUI

struct ParallaxScrollingView: View {
    @State var carouselIndex: Int = 0
    @State var currentDrag: CGFloat = 0
    var objectWidth: CGFloat = UIScreen.main.bounds.width - 140
    var objectPadding: CGFloat = 10
    var parallaxMagnitude: CGFloat = 80
    var body: some View {
        ZStack {
            ForEach(0..<6) {item in
                ZStack {

                    CardFlipView(front: {Image("card\(item)").resizable().aspectRatio(contentMode: .fit).frame(width: 250).offset(x: 10, y: -10)}, back: {Image("card\(item)").resizable().aspectRatio(contentMode: .fit).frame(width: 250).offset(x: 10, y: -10)})
                        
                        .frame(width: self.objectWidth, height: 380)
                        
                        
                        .offset(x: (CGFloat(item - self.carouselIndex) * (self.parallaxMagnitude)) + ((self.currentDrag / ((self.objectWidth + self.objectPadding))) * self.parallaxMagnitude))
                        
                }
                .shadow(radius: 2)
                .frame(width: self.objectWidth, height: 380)
                .cornerRadius(10)
                .offset(x:  (CGFloat(item - self.carouselIndex) * (self.objectWidth + self.objectPadding)) + self.currentDrag - 35)
                
                .animation(.easeInOut(duration: 0.2))
                .gesture(DragGesture().onChanged({drag in
                    self.currentDrag = drag.translation.width
                }).onEnded({drag in
                    if self.currentDrag > self.objectWidth / 2 {
                        if self.carouselIndex > 0 {
                            self.carouselIndex = self.carouselIndex - 1
                        }
                    } else if self.currentDrag < -self.objectWidth / 2 {
                        if self.carouselIndex < 6 - 1 {
                            self.carouselIndex = self.carouselIndex + 1
                        }
                    }
                    self.currentDrag = 0
                }))
            }
        }
    }
    func isCurrentIndex(item: Int) -> Bool {
        if item == carouselIndex {
            return true
        } else {
            return false
        }
    }
}

struct ParallaxScrollingVIew_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxScrollingView()
    }
}

