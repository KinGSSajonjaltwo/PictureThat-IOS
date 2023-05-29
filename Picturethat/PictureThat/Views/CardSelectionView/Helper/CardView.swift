//
//  CardView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/24.
//

import SwiftUI
import URLImage

struct CardView: View {
    var card: Card
    let cornerRadius: CGFloat = 15
    let borderWidth: CGFloat = 4
        
    init(card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .fill(Color.white)
                .frame(width: 286, height: 408)
                .shadow(color: Color.deckShadowColor, radius: 2, x: 0, y: 2)
            
            
            VStack(spacing: 0) {
                
                //Card Image with source
                ZStack {
                    
                    if let image = card.image{
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 249, height: 332)
                            .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
                    }else{
                        ZStack{
                            RoundedRectangle(cornerRadius: self.cornerRadius)
                                .foregroundColor(Color.cardImageLoadingColor)
                                .frame(width: 249, height: 332)
                            ProgressView()
                        }
                    }

                    
                    VStack{
                        Spacer()
                        Text(self.card.source)
                            .font(Font.cardSourceFont)
                            .foregroundColor(Color.cardSourceColor)
                    }
                    
                }
                .frame(width: 249, height: 332)
                .padding(.top, 17)
                
                
                Spacer()
                
                //Card Title
                Text(self.card.title)
                    .font(Font.cardTitleFont)
                    .foregroundColor(Color.cardTitleColor)
                    .padding(.bottom, 17)
                
                
            }
            
            
        }
        .frame(width: 286, height: 408)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.sampleCard1)
    }
}
