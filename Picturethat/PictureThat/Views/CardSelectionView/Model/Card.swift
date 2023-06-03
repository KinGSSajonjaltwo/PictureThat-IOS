//
//  Card.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/24.
//

import SwiftUI

struct Card: Identifiable, Codable{
    
    var deckID: String
    var id: String
    var title: String
    var imageURL: String
    var source: String
    var image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case deckID
        case id
        case title
        case imageURL
        case source
        case image
    }
    
    init(deckID: String, id: String, title: String, imageURL: String, source: String, image: UIImage? = nil) {
        self.deckID = deckID
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.source = source
        self.image = image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decode other properties
        deckID = try container.decode(String.self, forKey: .deckID)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        source = try container.decode(String.self, forKey: .source)
        
        // Decode image as Data and convert it to UIImage
        if let imageData = try container.decodeIfPresent(Data.self, forKey: .image) {
            image = UIImage(data: imageData)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        // Encode other properties
        try container.encode(deckID, forKey: .deckID)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(source, forKey: .source)
        
        // Convert UIImage to Data and encode it
        if let image = image {
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                try container.encode(imageData, forKey: .image)
            }
        }
    }
    
}

extension Card{
    
    static var sampleCard1 = Card(deckID: "소노공", id: "손오공1", title: "#두등등장", imageURL: "https://firebasestorage.googleapis.com/v0/b/picturethat-9f8ae.appspot.com/o/Decks%2F%EC%86%90%EC%98%A4%EA%B3%B5%2F%E1%84%89%E1%85%A9%E1%84%82%E1%85%A9%E1%84%80%E1%85%A9%E1%86%BC1.png?alt=media&token=85cd2400-06ab-467b-abb9-4959a71a437f", source: "@seventeen_17_n")
    
}
