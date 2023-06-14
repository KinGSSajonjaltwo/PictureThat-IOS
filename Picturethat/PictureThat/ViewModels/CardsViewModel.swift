//
//  CardsViewModel.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAnalytics

class CardsViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var loadingCards: Set<String> = []
    @Published var fetchCompleted: Bool = false
    
    private let firestore = Firestore.firestore()
    private let cardsCollection = "cards"
    
    func fetchCards(deckID: String) async{
        
        Analytics.logEvent("CardSelectionView_Appeared", parameters: ["deckID" : "\(deckID)"])
        guard let snapshot = try? await firestore.collection(cardsCollection).whereField("deckID", isEqualTo: deckID).order(by: "id").getDocuments() else {
            print("Error fetching cards")
            return
        }
        
        DispatchQueue.main.async {
            var fetchedCards = snapshot.documents.compactMap { document in
                let deckData = document.data()
                let deckID = deckData["deckID"] as? String ?? ""
                let id = deckData["id"] as? String ?? ""
                let title = deckData["title"] as? String ?? ""
                let imageURL = deckData["imageURL"] as? String ?? ""
                let source = deckData["source"] as? String ?? ""
                
                return Card(deckID: deckID, id: id, title: title, imageURL: imageURL, source: source)
            }
            
            if fetchedCards.count >= 5 {
                fetchedCards.shuffle()
                fetchedCards = Array(fetchedCards.prefix(4))
            }

            self.cards = fetchedCards
            self.fetchCompleted = true
        }
        
        
    }
    
    func loadImages(){
        
        for card in self.cards {
            if let imageURL = URL(string: card.imageURL) {
                self.loadingCards.insert(card.id)
                
                ImageLoader.loadImage(from: imageURL) { image in
                    if let image = image {
                        DispatchQueue.main.async {
                            if let index = self.cards.firstIndex(where: { $0.id == card.id }) {
                                self.cards[index].image = image
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.loadingCards.remove(card.id)
                    }
                }
            }
        }
        
    }
    
}


