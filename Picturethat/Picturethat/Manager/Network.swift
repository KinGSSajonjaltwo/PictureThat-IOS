//
//  Network.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/04.
//
import Foundation
import FirebaseDatabase

final class Network{
    
    static let shared = Network()
    
    // MARK: - Properties
    var cards: [Card] = []
    private var indexHistory: Set<Int> = Set<Int>()
    private var ver1Length: Int = 30
    
    private let ref = Database.database().reference()

    // MARK: - GET INDEX OF CARD
    func getIndexes(count: Int) -> Set<Int> {
        var result: Set<Int> = Set<Int>()
        
        if indexHistory.count > 30 {
            indexHistory = []
        }
        
        while result.count < count{
            let randomIndex = Int.random(in: 1...ver1Length)
            result.insert(randomIndex)
            indexHistory.insert(randomIndex)
        }
        
        return result
    }
    
    // MARK: - GET a set number of cards
    func getCards(count: Int) -> Void{
        let indexes = getIndexes(count: count)
        
        for i in indexes {
            ref.child("\(i)").observeSingleEvent(of: .value) { snapshot in
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
    
    // MARK: - GET Ver1 Length
    func getVer1Length() -> Void {
        
        ref.child("ver1Length").observeSingleEvent(of: .value) { snapshot in
            guard let returnVer1Length = snapshot.value as? Int else {return}
            self.ver1Length = returnVer1Length
        }
        
    }
    
                                                   
}
                                                   
