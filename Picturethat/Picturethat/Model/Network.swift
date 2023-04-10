//
//  Network.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/04.
//
import Foundation
import FirebaseDatabase

final class Network {
    
    static var shared: Network = Network()
    var resultCard : Card = Card(name: "", imgURL: "")
    
    
    let ref = Database.database().reference()
    
    
    func getRandomCards(cardCount: Int) -> [Card]{
        
        var resultCards: [Card] = [Card]()
        
        
        
        
        return resultCards
        
    }
    
    func getVer1Length() -> Int{
        
        var result: Int = 0
        
        self.ref.child("ver1Length").getData(completion: { error, snapshot in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return;
                
            }
            
            result = snapshot?.value as? Int ?? 10
            
        })
        
        return result
    }
    
    
    func getCardByIndx(index: Int) -> Card{
        
        
        var resultCard: Card = Card(name: "", imgURL: "")
        
        self.ref.child("\(index)").child("name").getData(completion: { error, snapshot in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return;
                
            }
            
            print("\(snapshot?.value as? String ?? "No")")
            resultCard.name = snapshot?.value as? String ?? "Unknown"
            
        })
        
        self.ref.child("\(index)").child("url").getData(completion: { error, snapshot in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return;
                
            }
            
            print("\(snapshot?.value as? String ?? "No")")
            resultCard.imgURL = snapshot?.value as? String ?? "Unknown"
            
        })
        
        
        return resultCard
        
        
    }
}

