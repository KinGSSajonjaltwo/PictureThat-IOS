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
            backButton(currentIndex: self.$currentIndex, cardViews: self.$cardViews)
            
            Spacer()
            
            nextButton(currentIndex: self.$currentIndex, cardCount: self.$cardCount, cardViews: self.$cardViews)
        }
        .padding()
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

struct backButton: View{
    @Binding var currentIndex: Int
    @Binding var cardViews: [CardView]
    
    var body: some View {
        
        Button {
            
            if self.currentIndex > 0 {
                
                self.cardViews.removeLast()
                self.currentIndex -= 1
                
                if self.currentIndex > 0 {
                    
                    let card = ModelData.cardDeck[currentIndex - 1]
                    
                    let newCardView = CardView(card: card)
                    
                    self.cardViews.insert(newCardView, at: 0)
                    
                }
                
            }
            
        } label: {
            Image(systemName: "arrow.counterclockwise.circle.fill")
                .foregroundColor(self.currentIndex > 0 ? Color.btnEnableColor : Color.btnDisableColor)
        }
        
        
    }
    
}

struct nextButton: View{
    @Binding var currentIndex: Int
    @Binding var cardCount: Int
    @Binding var cardViews: [CardView]
    
    var body: some View {
        
        Button {
            
            if self.currentIndex < self.cardCount {
                
                self.cardViews.removeFirst()
                self.currentIndex += 1
                
                if self.currentIndex < self.cardCount - 1  {
                    
                    let card = ModelData.cardDeck[currentIndex+1]
                    
                    let newCardView = CardView(card: card)
                    
                    self.cardViews.append(newCardView)
                    
                }
                
            }
            
        } label: {
            Image(systemName: "arrow.forward.circle.fill")
                .foregroundColor(self.currentIndex < self.cardCount ? Color.btnEnableColor : Color.btnDisableColor)
        }
        
        
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


