//
//  FourCardView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/31.
//

import SwiftUI

struct FourCardView: View {
    let deck: Deck
    let cornerRadius: CGFloat = 15
    let borderWidth: CGFloat = 4
    
    @ObservedObject var cardsViewModel: CardsViewModel
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .fill(Color.white)
                .frame(width: 286, height: 408)
                .shadow(color: Color.deckShadowColor, radius: 2, x: 0, y: 2)
            
            
            VStack(spacing: 0) {
                if cardsViewModel.fetchCompleted{
                    ZStack {
                        
                        //이미지 4개 GridView
                        VStack(spacing: 4) {
                            
                            //왼쪽 이미지 2개
                            HStack(spacing: 4) {
                                
                                ForEach(0..<2) { index in
                                    
                                    ZStack{
                                        
                                        if let image = cardsViewModel.cards[index].image{
                                            Image(uiImage: image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 123, height: 164)
                                        }else{
                                            Rectangle()
                                                .foregroundColor(Color.cardImageLoadingColor)
                                                .frame(width: 123, height: 164)
                                            ProgressView()
                                        }
                                        
                                        VStack{
                                            Spacer()
                                            Text(self.cardsViewModel.cards[index].source)
                                                .font(Font.simpleCardSourceFont)
                                                .foregroundColor(Color.cardSourceColor)
                                        }
                                        
                                    }
                                    .frame(width: 123, height: 164)
                                    
                                }
                                
                            }
                            
                            //오른쪽 이미지 2개
                            HStack(spacing: 4) {
                                
                                ForEach(2..<4) { index in
                                    
                                    ZStack{
                                        
                                        if let image = cardsViewModel.cards[index].image{
                                            Image(uiImage: image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 123, height: 164)
                                        }else{
                                            Rectangle()
                                                .foregroundColor(Color.cardImageLoadingColor)
                                                .frame(width: 123, height: 164)
                                            ProgressView()
                                        }
                                        
                                        VStack{
                                            Spacer()
                                            Text(self.cardsViewModel.cards[index].source)
                                                .font(Font.simpleCardSourceFont)
                                                .foregroundColor(Color.cardSourceColor)
                                        }
                                        
                                    }
                                    .frame(width: 123, height: 164)
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                    }
                    .frame(width: 249, height: 332)
                    .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
                    .padding(.top, 17)
                    
                }else{
                    
                    Rectangle()
                        .frame(width: 249, height: 332)
                        .padding(.top, 17)
                    
                }
                
                Spacer()
                
                //Card Title
                Text(self.deck.title)
                    .font(Font.cardTitleFont)
                    .foregroundColor(Color.cardTitleColor)
                    .padding(.bottom, 17)
                
            }
            
            
        }
        .frame(width: 286, height: 408)
        
    }
    
}



//struct FourCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FourCardView()
//    }
//}
