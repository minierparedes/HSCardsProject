//
//  HSCardModelImageCacheManager.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/26.
//

import Foundation
import SwiftUI

class HSCardModelImageCacheManager {
    
    static let instance = HSCardModelImageCacheManager()
    private init() { }
    
    var cardImageCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200// 200mb
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        cardImageCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return cardImageCache.object(forKey: key as NSString)
    }
}
