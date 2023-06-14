//
//  Deck.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/05.
//

import SwiftUI

struct Deck: Identifiable, Equatable{
    
    var id: String
    var title: String
    var imageURL: String
    var image: UIImage?
    
}

extension Deck{
    static var sampleDeck1: Deck = Deck(id: "SampleDeck1", title: "SampleDeckName", imageURL: "https://firebasestorage.googleapis.com/v0/b/picture-that-84402.appspot.com/o/DeckThumbnail%2F%E1%84%82%E1%85%A5%E1%84%90%E1%85%B5%E1%84%8B%E1%85%A3.png?alt=media&token=bda32d4a-4751-41a6-a0b6-c099081e0fa1")
    static var sampleDeck2: Deck = Deck(id: "SampleDeck2", title: "SampleDeckName", imageURL: "https://firebasestorage.googleapis.com/v0/b/picture-that-84402.appspot.com/o/DeckThumbnail%2F%E1%84%86%E1%85%A1%E1%84%8E%E1%85%B5%E1%84%83%E1%85%AC%E1%86%AB%E1%84%80%E1%85%A5%E1%86%BA%E1%84%80%E1%85%A1%E1%87%80%E1%84%8B%E1%85%A1%E1%84%89%E1%85%A9%E1%84%82%E1%85%A9%E1%84%80%E1%85%A9%E1%86%BC.png?alt=media&token=bb73a59c-1ddb-4eab-8e31-85611970948f")
}
