//
//  PocaRanView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
//

import SwiftUI

struct PocaRanView: View {
    // MARK: - Properties
    
    @Binding var cardCount: Int
    @State var currentIndex: Int = 0
    
    @State private var offset = CGSize.zero
    
    // MARK: - CARD Views
    var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2{
            views.append(CardView(card: ModelData.cardDeck[index]))
        }
        return views
    }()
    
    private func isTopCard(cardView: CardView) -> Bool{
        
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {return false}
        return index == 0
        
    }
    
    var body: some View {
        
        PocaRanToolBarContainerView(cardCount: self.$cardCount, currentIntdex: self.$currentIndex){
            VStack{
                ZStack{
                    
                    ForEach(cardViews) { cardView in
                        cardView
                            .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                            .offset(self.isTopCard(cardView: cardView) ? CGSize(width: offset.width, height: offset.height * 0.4): CGSize.zero)
                            .gesture(
                                DragGesture()
                                    .onChanged{ gesture in
                                        
                                        if self.isTopCard(cardView: cardView){
                                            offset = gesture.translation
                                        }
                                    }
                                    .onEnded{ _ in
                                        print("end")
                                    }
                            )
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
