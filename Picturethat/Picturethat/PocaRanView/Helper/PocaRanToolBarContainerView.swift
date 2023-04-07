//
//  PocaRanNavBarContainerView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/03.
//

import SwiftUI

struct PocaRanToolBarContainerView<Content: View>: View {
    
    @Binding var currentIndex: Int
    @Binding var cardCount: Int
    @Binding var cardViews: [CardView]
    let content: Content
    
    
    init(cardCount: Binding<Int>, currentIntdex: Binding<Int>, cardViews: Binding<[CardView]>, @ViewBuilder content: () -> Content) {
        
        self._cardCount = cardCount
        self._currentIndex = currentIntdex
        self._cardViews = cardViews
        self.content = content()
        
    }
    
    var body: some View {
        
        
        ZStack{
            
            Image("PocaRanViewBG")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                PocaRanNavBarView(currentIndex: self.$currentIndex, cardCount: self.$cardCount)
                content.frame(maxWidth: .infinity, maxHeight: .infinity)
                PocaRanControlBarView(currentIndex: self.$currentIndex, cardCount: self.$cardCount, cardViews: self.$cardViews)
            }
            
        }
        
        
    }
}

struct PocaRanToolBarContainerView_Previews: PreviewProvider {
    
    struct PocaRanToolBarContainerViewContainer: View {
        @State var views: [CardView] = [CardView(card: ModelData.shared.cardDeck[0]),CardView(card: ModelData.shared.cardDeck[1])]

        var body: some View {
            PocaRanToolBarContainerView(cardCount: .constant(4), currentIntdex: .constant(1), cardViews: $views) {
                VStack{
                    
                }
            }
        }
    }
    

    static var previews: some View {
        
        PocaRanToolBarContainerViewContainer()
                      
                   
    }
    
    
}
