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
    
    var body: some View {
        HStack{
            backButton(currentIndex: self.$currentIndex)
            
            Spacer()
            
            nextButton(currentIndex: self.$currentIndex, cardCount: self.$cardCount)
        }
        .padding()
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

struct PocaRanControlBarView_Previews: PreviewProvider {
    static var previews: some View {
        PocaRanControlBarView(currentIndex: .constant(1), cardCount: .constant(4))
    }
}


struct backButton: View{
    @Binding var currentIndex: Int
    
    var body: some View {
        
        Button {
            
            if self.currentIndex > 0 {
                self.currentIndex -= 1
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
    
    var body: some View {
        
        Button {
            
            if self.currentIndex < self.cardCount {
                self.currentIndex += 1
            }
            
        } label: {
            Image(systemName: "arrow.forward.circle.fill")
                .foregroundColor(self.currentIndex < self.cardCount ? Color.btnEnableColor : Color.btnDisableColor)
        }
        
        
    }
    
}
