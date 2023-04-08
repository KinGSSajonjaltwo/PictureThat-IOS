//
//  CardViewModel.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/08.
//

import SwiftUI

class CardViewModel: ObservableObject{
    
    @Published var cardViews: [CardView] = [CardView]()
    @Published var cardCount: Int = 4
    @Published var currentIndex: Int = 0
    
    var cards: [Card] = [Card]()
    
    func getCards(){
        self.cards = [Card]()
        
        for index in 0..<self.cardCount{
            
            self.cards.append(Card(name: "\(index)", imgURL: "\(index) url"))
            
        }
        
    }
    
    // MARK: - Set Initial Card View
    func setInitialCardViews(){
        
        getCards()
        
        self.cardViews = [CardView]()
        
        self.cardViews.append(CardView(card: ModelData.shared.cardDeck[0], isTopCard: true))
        self.cardViews.append(CardView(card: ModelData.shared.cardDeck[1], isTopCard: false))
        
    }
    
    // MARK: - Set Next CardView
    
    func setNextCardView(){
        
        if self.currentIndex < self.cardCount - 1{
            
            self.cardViews.removeFirst()
            self.cardViews[0].isTopCard = true
            
            if self.currentIndex < self.cardCount - 2{
                
                let card = self.cards[currentIndex+2]
                
                let newCardView = CardView(card: card, isTopCard: false)
                
                self.cardViews.append(newCardView)
            }
            
            self.currentIndex += 1
            
        }
        
    }
    
    // MARK: - Set Prev CardView
    
    func setPrevCardView(){
        
        let card = self.cards[currentIndex-1]
        let newCardView = CardView(card: card, isTopCard: true)
        self.cardViews.insert(newCardView, at: 0)
        
        self.cardViews[1].isTopCard = false
        
        self.currentIndex -= 1
        
    }
    
    
    
    
}
