//
//  ModelData.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/04.
//

import Foundation

class ModelData {
    
    static var shared: ModelData = ModelData()
    
    var cardDeck: [Card] = [
        Card(name: "0", imgURL: "1 url"),
        Card(name: "1", imgURL: "1 url"),
        Card(name: "2", imgURL: "1 url"),
        Card(name: "3", imgURL: "1 url")
    ]
    
    func setCardDeck(cardCount: Int){
        
        self.cardDeck = [Card]()
        
        for index in 0..<cardCount{
            
            cardDeck.append(Card(name: "\(index)", imgURL: "\(index) url"))
        
        }
        
        print(self.cardDeck)
    }
    
}

