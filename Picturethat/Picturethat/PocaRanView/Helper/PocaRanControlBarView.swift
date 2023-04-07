//
//  PocaRanControlBarView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/04.
//

import SwiftUI

struct PocaRanControlBarView: View {
    
    @Binding var currentIndex: Int
    @Binding var cardCount: Int
    @Binding var cardViews: [CardView]
    
    var body: some View {
        HStack{
            backButton(currentIndex: self.$currentIndex, cardCount: self.$cardCount, cardViews: self.$cardViews)
            
            Spacer()
            
            nextButton(currentIndex: self.$currentIndex, cardCount: self.$cardCount, cardViews: self.$cardViews)
        }
        .padding()
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

struct backButton: View{
    @Binding var currentIndex: Int
    @Binding var cardCount: Int
    @Binding var cardViews: [CardView]

    
    var body: some View {
        
        Button {
            
            if self.currentIndex > 0 {
                
                if self.currentIndex < cardCount - 1{
                
                    self.cardViews.removeLast()
                    
                }
                
                setPreCard()
                
                currentIndex -= 1
            }
                
        } label: {
            Image(systemName: "arrow.counterclockwise.circle.fill")
                .foregroundColor(self.currentIndex > 0 ? Color.btnEnableColor : Color.btnDisableColor)
        }
        .disabled(currentIndex == 0)
        
        
    }
    
    // MARK: - Set Prev Card
    private func setPreCard(){
        
        let card = ModelData.cardDeck[currentIndex-1]
        
        let newCardView = CardView(card: card, isTopCard: true)
        
        self.cardViews.insert(newCardView, at: 0)
        self.cardViews[1].isTopCard = false
    }
    
}

struct nextButton: View{
    @Binding var currentIndex: Int
    @Binding var cardCount: Int
    @Binding var cardViews: [CardView]
    
    var body: some View {
        
        Button {
            
            if self.currentIndex < self.cardCount - 1 {
                
                
                self.cardViews.removeFirst()
                self.cardViews[0].isTopCard = true
                
                if self.currentIndex < (self.cardCount - 2) {
                    //Get next Card
                    self.setNextCard()
                }
                
                self.currentIndex += 1
                
            }
            
            
        } label: {
            Image(systemName: "arrow.forward.circle.fill")
                .foregroundColor(( self.currentIndex <  self.cardCount - 1) ? Color.btnEnableColor : Color.btnDisableColor)
        }
        .disabled(currentIndex == (cardCount - 1) )
        
        
    }
    
    // MARK: - Set Next Card
    private func setNextCard(){
        let card = ModelData.cardDeck[currentIndex+2]
        
        let newCardView = CardView(card: card, isTopCard: false)
        
        self.cardViews.append(newCardView)
    }
    
}

struct PocaRanControlBarView_Previews: PreviewProvider {
    
    struct PocaRanControlBarViewContainer: View {
        
        @State var views: [CardView] = [CardView(card: ModelData.cardDeck[0]),CardView(card: ModelData.cardDeck[1])]
        var body: some View {
            PocaRanControlBarView(currentIndex: .constant(1), cardCount: .constant(4), cardViews: $views)
        }
        
    }

    static var previews: some View {
            PocaRanControlBarViewContainer()
    }
}


