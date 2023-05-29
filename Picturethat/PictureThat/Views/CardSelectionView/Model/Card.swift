//
//  Card.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/24.
//

import SwiftUI

struct Card: Identifiable{
    
    var deckID: String
    var id: String
    var title: String
    var imageURL: String
    var source: String
    var image: UIImage?
    
}

extension Card{
    
    static var sampleCard1 = Card(deckID: "소노공", id: "손오공1", title: "#두등등장", imageURL: "https://firebasestorage.googleapis.com/v0/b/picturethat-9f8ae.appspot.com/o/Decks%2F%EC%86%90%EC%98%A4%EA%B3%B5%2F%E1%84%89%E1%85%A9%E1%84%82%E1%85%A9%E1%84%80%E1%85%A9%E1%86%BC1.png?alt=media&token=85cd2400-06ab-467b-abb9-4959a71a437f", source: "@seventeen_17_n")
    
}
