//
//  PocaRanView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
//

import SwiftUI

struct PocaRanView: View {
    @Binding var cardCount: Int
    
    var body: some View {
        
        PocaRanNavBarContainerView {
            ZStack{
                Image("HomewViewBG")
                    .resizable()
                    .ignoresSafeArea()
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
