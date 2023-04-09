//
//  PocaRanNavBarView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/03.
//

import SwiftUI

struct PocaRanNavBarView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var cardViewModel: CardViewModel
    
    var body: some View {
        HStack{
            
            backButton
            
            Spacer()
            
            Text("\(self.cardViewModel.getNavBarText())")
                .font(.noto(.medium, size: 20))
                .foregroundColor(.black01)
            
            Spacer()
            
            backButton.opacity(0)
            
        }
        .padding()
        .background(Color.white.ignoresSafeArea(edges: .top))
    }
}

struct PocaRanNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        PocaRanNavBarView().environmentObject(CardViewModel(cardCount: 4))
    }
}


extension PocaRanNavBarView{
    private var backButton: some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "house")
                .foregroundColor(Color.black01)
        }
    }
}
