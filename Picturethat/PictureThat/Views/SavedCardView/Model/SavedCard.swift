//
//  SavedCard.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/06/03.
//

import SwiftUI

struct SavedCard: Identifiable, Codable{
    
    let id: String
    var cards: [Card]
    
    init(cards: [Card]) {
        self.id = UUID().uuidString
        self.cards = cards
    }
    
}
