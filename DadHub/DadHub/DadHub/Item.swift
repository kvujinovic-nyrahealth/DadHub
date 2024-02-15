//
//  Item.swift
//  DadHub
//
//  Created by Katharina Vujinovic on 06.12.23.
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
