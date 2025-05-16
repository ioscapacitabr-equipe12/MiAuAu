//
//  Item.swift
//  MiAuAu
//
//  Created by iredefbmac_21 on 16/05/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
