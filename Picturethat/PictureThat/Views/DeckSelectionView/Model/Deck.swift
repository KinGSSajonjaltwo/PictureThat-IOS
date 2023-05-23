//
//  Deck.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/05.
//

import SwiftUI

struct Deck: Identifiable, Codable{
    
    var id: String
    var title: String
    var imageURL: String
    
}

extension Deck{
    static var sampleDeck1: Deck = Deck(id: "SampleDeck1", title: "SampleDeckName", imageURL: "img_heartDeckThumbnail")
    static var sampleDeck2: Deck = Deck(id: "SampleDeck2", title: "SampleDeckName", imageURL: "img_downloadThumbnail")
}
