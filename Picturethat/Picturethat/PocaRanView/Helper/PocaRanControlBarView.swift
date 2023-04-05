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
            backButton
            
            Spacer()
            
            nextButton
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


extension PocaRanControlBarView{
    
    private var backButton: some View{
        Button {
            print("prev card")
        } label: {
            Image(systemName: "arrow.counterclockwise.circle.fill")
                .foregroundColor(Color.black01)
        }
    }
    
    private var nextButton: some View{
        Button {
            print("next card")
        } label: {
            Image(systemName: "arrow.forward.circle.fill")
                .foregroundColor(Color.black01)
        }
    }
}
