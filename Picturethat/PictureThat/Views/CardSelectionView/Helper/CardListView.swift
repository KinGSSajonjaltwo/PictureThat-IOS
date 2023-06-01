//
//  CardListView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/24.
//

import SwiftUI

struct CardListView: View {
    
    var deck: Deck
    @StateObject var cardsViewModel: CardsViewModel = CardsViewModel()
    
    var body: some View {
        
        GeometryReader { geo in
            TabView {
                
                FourCardView(deck: self.deck, cardsViewModel: cardsViewModel)
                
                ForEach(cardsViewModel.cards) { card in
                    
                    CardView(card: card)
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle())
        }
        .frame(height: 600)
        .task{
            await cardsViewModel.fetchCards(deckID: deck.id)
            cardsViewModel.loadImages()
        }
        
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(deck: Deck.sampleDeck1)
    }
}
