//
//  PocaRanView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
//

import SwiftUI

struct PocaRanView: View {
    @Binding var cardCount: Int
    
    var testDeck: [Card] = ModelData.cardDeck
    
    var body: some View {
        
        PocaRanToolBarContainerView{
            VStack{
                ZStack{
                    
                    ForEach(self.testDeck.reversed(), id: \.self) { card in
                        CardView(card: card)
                    }
                     
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)

    
    }
}

struct PocaRanView_Previews: PreviewProvider {
    static var previews: some View {
        PocaRanView(cardCount: .constant(10))
    }
}
