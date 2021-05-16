//
//  HSCardModelManager.swift
//  HearthStoneCards
//
//  Created by ethancr0wn on 2021/05/16.
//

import SwiftUI

class HSCardModelFileManager {
    static let instance = HSCardModelFileManager()
    let folderName = "downloaded_hscards"
    private init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        guard let url = getFolderPath() else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default
            } catch <#pattern#> {
                <#statements#>
            }
        }
    }
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
}

