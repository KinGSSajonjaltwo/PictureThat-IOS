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
    
    let content: Content
    
    
    init(cardCount: Binding<Int>, currentIntdex: Binding<Int>, @ViewBuilder content: () -> Content) {
        
        self._cardCount = cardCount
        self._currentIndex = currentIntdex
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
                PocaRanControlBarView(currentIndex: self.$currentIndex, cardCount: self.$cardCount)
            }
            
        }
        
        
    }
}

struct PocaRanToolBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        PocaRanToolBarContainerView(cardCount: .constant(4), currentIntdex: .constant(1)) {
            VStack{
                
            }
        }
        
    }
}
