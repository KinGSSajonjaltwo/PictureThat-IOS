//
//  CardViewModel.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/08.
//

import SwiftUI

class CardViewModel: ObservableObject{
    
    @Published var cardViews: [CardView] = [CardView]()
    @Published var currentIndex: Int = 0
    
    private var cardCount: Int
    private var cards: [Card] = [Card]()
    
    // MARK: - init based on cardCount
    init(cardCount: Int) {
        
        self.cardCount = cardCount
        self.setInitialCardViews()
        
    }
    
    // MARK: - Get Cards
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
        
        if self.currentIndex > 0 {
            
            
            if self.currentIndex < cardCount - 1{
            
                self.cardViews.removeLast()
                
            }
            
            let card = self.cards[currentIndex-1]
            let newCardView = CardView(card: card, isTopCard: true)
            self.cardViews.insert(newCardView, at: 0)
            
            self.cardViews[1].isTopCard = false
            
            self.currentIndex -= 1
            
        }

        
    }
    
    // MARK: - is Top Card
    func isTopCard(cardView: CardView) -> Bool{
        
        guard let index = self.cardViews.firstIndex(where: { $0.id == cardView.id }) else {return false}
        return index == 0
        
    }
    
    
    // MARK: - is Fist Card
    func isFirstCard() -> Bool{
        return self.currentIndex == 0
    }
    
    // MARK: - is Last Card
    func isLastCard() -> Bool{
        return self.currentIndex == self.cardCount - 1
    }
    
    // MARK: - NavBarText
    func getNavBarText() -> String{
        return "\(self.currentIndex)/\(self.cardCount)"
    }
    
}
