//
//  AppleHLS.swift
//  DeveloperApp
//
//  Created by 황석현 on 9/19/25.
//

import Foundation

struct AppleHLS: Hashable {
    
    let hlsUrl: URL
    
    init(hlsUrl: URL) {
        self.hlsUrl = hlsUrl
    }
}
