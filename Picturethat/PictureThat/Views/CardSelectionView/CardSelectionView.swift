//
//  CardSelectionView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/25.
//

import SwiftUI

struct CardSelectionView: View {
    var deck: Deck
    var body: some View {
        CardListView(deck: self.deck)
    }
}

struct CardSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardSelectionView(deck: Deck.sampleDeck1)
    }
}
