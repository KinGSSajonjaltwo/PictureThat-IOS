//
//  CardsViewModel.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/25.
//

import SwiftUI
import FirebaseFirestore

class CardsViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var loadingImages: Set<String> = []
    
    private let firestore = Firestore.firestore()
    private let cardsCollection = "cards"
    
    func fetchCards(deckID: String) {
        firestore.collection(cardsCollection)
            .whereField("deckID", isEqualTo: deckID)
            .order(by: "id")
            .getDocuments { (snapshot, error) in
                guard let documents = snapshot?.documents else {
                    print("Error fetching decks: \(error?.localizedDescription ?? "")")
                    return
                }
                
                self.cards = documents.compactMap { document in
                    let deckData = document.data()
                    let deckID = deckData["deckID"] as? String ?? ""
                    let id = deckData["id"] as? String ?? ""
                    let title = deckData["title"] as? String ?? ""
                    let imageURL = deckData["imageURL"] as? String ?? ""
                    let source = deckData["source"] as? String ?? ""
                    
                    return Card(deckID: deckID, id: id, title: title, imageURL: imageURL, source: source)
                }
                
                
                // 이미지 로딩
                for card in self.cards {
                    if let imageURL = URL(string: card.imageURL) {
                        self.loadingImages.insert(card.id)
                        
                        ImageLoader.loadImage(from: imageURL) { image in
                            if let image = image {
                                DispatchQueue.main.async {
                                    if let index = self.cards.firstIndex(where: { $0.id == card.id }) {
                                        self.cards[index].image = image
                                    }
                                }
                            }
                            
                            DispatchQueue.main.async {
                                self.loadingImages.remove(card.id)
                            }
                        }
                    }
                }
            }
    }
}


