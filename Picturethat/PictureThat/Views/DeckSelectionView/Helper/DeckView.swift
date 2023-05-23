//
//  DeckView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/05.
//

import SwiftUI

struct DeckView: View {
    var deck: Deck
    let cornerRadius: CGFloat = 15
    let borderWidth: CGFloat = 4
    
    init(deck: Deck) {
        self.deck = deck
    }
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(Color.white)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .shadow(color: Color.deckShadowColor, radius: 2, x: 0, y: 2)
                
                Image(self.deck.imageURL)
                    .resizable()
                    .frame(width: geo.size.width - borderWidth*2, height: geo.size.height - borderWidth*2)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
                
            }
        }
        
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: Deck.sampleDeck1)
            .frame(width: 300, height: 400)
    }
}
