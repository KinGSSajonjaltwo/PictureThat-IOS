//
//  Network.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/04.
//
import Foundation
import FirebaseDatabase

final class Network {
    
    @Published var cards: [Card] = [Card(name: "Test1", imgURL: "test1")]
    private let ref = Database.database().reference()

    // MARK: - GET INDEX OF CARD
    func getIndexes(count: Int) -> [String] {
        var result: [String] = []
        
        for index in 1...count{
            result.append("\(index)")
        }
        
        return result
    }
    
    // MARK: - GET a set number of cards
    func getCards(count: Int)-> Void{
        let indexes = getIndexes(count: count)
        
        for i in indexes {
            ref.child(i).observeSingleEvent(of: .value) { snapshot in
                guard let card = snapshot.value else { return }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: card, options: [])
                    let decoder = JSONDecoder()
                    let resultCard = try decoder.decode(Card.self, from: jsonData)
                    self.cards.append(resultCard)
                    print(self.cards)
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }

        
    }
    
}

