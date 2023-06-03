//
//  SavedCardView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/06/03.
//

import SwiftUI

struct SavedCardView: View {
    @EnvironmentObject private var savedCardsData: SavedCardsData
    
    var body: some View {
        TabView {
            
            ForEach(savedCardsData.savedCardsViewModel.savedCards) { savedCard in
                Image(uiImage: savedCard.cards[0].image!)
            }
            
        }
        .task {
            savedCardsData.savedCardsViewModel.loadCards()
        }
    }
}

struct SavedCardView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCardView()
    }
}
