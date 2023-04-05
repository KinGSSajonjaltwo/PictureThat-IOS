//
//  Network.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/04.
//
import Foundation
import FirebaseDatabase
import Combine

final class Network: ObservableObject {
    
    @Published var resultCard : Card = Card(name: "", imgURL: "")
    
    let ref = Database.database().reference()
    
    func testgetCard(index: Int) -> Card{
        
        
        self.ref.child("\(index)").child("name").getData(completion: { error, snapshot in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return;
                
            }
            
            print("\(snapshot?.value as? String ?? "No")")
            self.resultCard.name = snapshot?.value as? String ?? "Unknown"
            
        })
        
        self.ref.child("\(index)").child("imgURL").getData(completion: { error, snapshot in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return;
                
            }
            
            print("\(snapshot?.value as? String ?? "No")")
            self.resultCard.imgURL = snapshot?.value as? String ?? "Unknown"
            
        })
        
        
        
        return resultCard
        
        
    }
}

