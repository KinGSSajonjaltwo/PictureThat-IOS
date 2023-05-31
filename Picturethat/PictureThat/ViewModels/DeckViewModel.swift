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
    @Published var loadingDecks: Set<String> = []
    @Published var fetchCompleted: Bool = false
    
    private let firestore = Firestore.firestore()
    private let decksCollection = "decks"
    
    func fetchDecks() async{

        guard let snapshot = try? await firestore.collection(decksCollection).order(by: "id").getDocuments() else {
            print("Error fetching decks")
            return
        }
        
        DispatchQueue.main.async {
            self.decks = snapshot.documents.compactMap { document in
                let deckData = document.data()
                let id = deckData["id"] as? String ?? ""
                let title = deckData["title"] as? String ?? ""
                let imageURL = deckData["imageURL"] as? String ?? ""
                
                return Deck(id: id, title: title, imageURL: imageURL)
            }
            
            self.fetchCompleted = true
        }
        
    }
    
    func loadImages(){
        
        for deck in self.decks{
            if let imageURL = URL(string: deck.imageURL) {
                self.loadingDecks.insert(deck.id)
                
                ImageLoader.loadImage(from: imageURL) { image in
                    if let image = image {
                        DispatchQueue.main.async {
                            if let index = self.decks.firstIndex(where: { $0.id == deck.id }) {
                                self.decks[index].image = image
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.loadingDecks.remove(deck.id)
                    }
                }
            }
        }
        
    }
    
    
}
