//
//  PocaRanView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
//

import SwiftUI

struct PocaRanView: View {
    // MARK: - Properties
    //Swipe
    @State private var offset = CGSize.zero
    
    // MARK: - CARD View Model
    @StateObject var cardViewModel: CardViewModel

    // MARK: - body
    var body: some View {
        
        PocaRanToolBarContainerView{
            VStack{
                ZStack{
                    
                    ForEach(self.cardViewModel.cardViews) { cardView in
                        cardView
                            .zIndex(self.cardViewModel.isTopCard(cardView: cardView) ? 1 : 0)
                            .offset(self.cardViewModel.isTopCard(cardView: cardView) ? CGSize(width: offset.width, height: offset.height * 0.4): CGSize.zero)
                            .rotationEffect(
                                .degrees(self.cardViewModel.isTopCard(cardView: cardView) ? Double(offset.width / 40) : Double(0.0))
                            )
                            .gesture(
                                DragGesture()
                                    .onChanged{ gesture in
                                        
                                        if self.cardViewModel.isTopCard(cardView: cardView){
                                            offset = gesture.translation
                                        }
                                    }
                                    .onEnded{ _ in
                                        if self.cardViewModel.isTopCard(cardView: cardView){
                                            swipeCard(width: offset.width)
                                        }
                                    }
                            )
                    }
                    
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .environmentObject(cardViewModel)
        .task {
            cardViewModel.setInitialCardViews()
        }
        
    
    }
}

struct PocaRanView_Previews: PreviewProvider {
    static var previews: some View {
        PocaRanView(cardViewModel: CardViewModel(cardCount: 4))
    }
}

extension PocaRanView{
    // MARK: - Swipe Card
    private func swipeCard(width: CGFloat) {
        switch width{
        case -500...(-150):
            offset = CGSize(width: -1000, height: 0)
            self.cardViewModel.setNextCardView()
            offset = .zero
        case 150...500:
            offset = CGSize(width: 1000, height: 0)
            self.cardViewModel.setNextCardView()
            offset = .zero
        default:
            offset = .zero
        }
    }
    
}
