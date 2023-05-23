//
//  DeckViewModel.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/23.
//

import SwiftUI
import FirebaseFirestore

class DeckViewModel: ObservableObject {
    @Published var decks: [Deck] = []
    
    private let firestore = Firestore.firestore()
    private let decksCollection = "decks"
    
    func fetchDecks() {
        firestore.collection(decksCollection).order(by: "id").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching decks: \(error?.localizedDescription ?? "")")
                return
            }
            
            self.decks = documents.compactMap { document in
                let deckData = document.data()
                let id = deckData["id"] as? String ?? ""
                let title = deckData["title"] as? String ?? ""
                let imageURL = deckData["imageURL"] as? String ?? ""
                
                return Deck(id: id, title: title, imageURL: imageURL)
            }
        }
    }
}
