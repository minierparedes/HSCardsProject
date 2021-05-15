//
//  HSCardModelCacheManager.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/15.
//

import SwiftUI

class HSCardModelCacheManager {
    static let instance = HSCardModelCacheManager()
    private init(){}
    
    var hscardsCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200// 200mb?
        return cache
    }
}

