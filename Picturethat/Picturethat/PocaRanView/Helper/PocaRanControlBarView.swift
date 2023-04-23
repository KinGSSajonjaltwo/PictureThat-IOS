//
//  PocaRanControlBarView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/04.
//

import SwiftUI

struct PocaRanControlBarView: View {
    
    @EnvironmentObject var cardViewModel: CardViewModel
    
    var body: some View {
        HStack{
            Button {
                
                self.cardViewModel.setPrevCardView()
                    
            } label: {
                Image(systemName: "arrow.counterclockwise.circle.fill")
                    .foregroundColor(
                        (!self.cardViewModel.isLoaded ||  self.cardViewModel.isFirstCard()) ?
                        Color.btnDisableColor:
                        Color.btnEnableColor)
            }
            .disabled(!self.cardViewModel.isLoaded ||  self.cardViewModel.isFirstCard())
            
            Spacer()
            
            Button {
                
                self.cardViewModel.setNextCardView()
                
                
            } label: {
                Image(systemName: "arrow.forward.circle.fill")
                    .foregroundColor( (!self.cardViewModel.isLoaded || self.cardViewModel.isLastCard()) ? Color.btnDisableColor: Color.btnEnableColor)
            }
            .disabled(!self.cardViewModel.isLoaded || self.cardViewModel.isLastCard())
            
        }
        .padding()
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}


struct PocaRanControlBarView_Previews: PreviewProvider {
    
    static var previews: some View{
        PocaRanControlBarView().environmentObject(CardViewModel(cardCount: 4))
    }


}


