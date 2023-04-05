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
    
    //Swipe
    @State private var offset = CGSize.zero
    
    
    // MARK: - CARD Views
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2{
            views.append(CardView(card: ModelData.cardDeck[index]))
        }
        return views
    }()
    

    // MARK: - body
    var body: some View {
        
        PocaRanToolBarContainerView(cardCount: self.$cardCount, currentIntdex: self.$currentIndex){
            VStack{
                ZStack{
                    
                    ForEach(cardViews) { cardView in
                        cardView
                            .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                            .offset(self.isTopCard(cardView: cardView) ? CGSize(width: offset.width, height: offset.height * 0.4): CGSize.zero)
                            .rotationEffect(
                                .degrees(self.isTopCard(cardView: cardView) ? Double(offset.width / 40) : Double(0.0))
                            )
                            .gesture(
                                DragGesture()
                                    .onChanged{ gesture in
                                        
                                        if self.isTopCard(cardView: cardView) && (currentIndex != cardCount){
                                            offset = gesture.translation
                                        }
                                    }
                                    .onEnded{ _ in
                                        if self.isTopCard(cardView: cardView){
                                            swipeCard(width: offset.width)
                                        }
                                    }
                            )
                            .onTapGesture {
                                cardView.flipCard()
                            }
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

extension PocaRanView{
    // MARK: - Top Card
    private func isTopCard(cardView: CardView) -> Bool{
        
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {return false}
        return index == 0
        
    }
    
    // MARK: - Swipe Card
    private func swipeCard(width: CGFloat) {
        switch width{
        case -500...(-200):
            offset = CGSize(width: -1000, height: 0)
            self.moveCard()
            self.offset = CGSize.zero
        case 200...500:
            offset = CGSize(width: 1000, height: 0)
            self.moveCard()
            self.offset = CGSize.zero
        default:
            offset = .zero
        }
    }
    
    // MARK: - Move Card
    private func moveCard(){
        self.cardViews.removeFirst()
        self.currentIndex += 1
        
        if self.currentIndex < self.cardCount - 1  {
            
            let card = ModelData.cardDeck[currentIndex+1]
            
            let newCardView = CardView(card: card)
            
            self.cardViews.append(newCardView)
            
        }
        
    }
    
}
