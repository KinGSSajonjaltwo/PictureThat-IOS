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
                    
                    if let url = URL(string: self.card.imageURL){
                        
                        URLImage(url) {
                            RoundedRectangle(cornerRadius: self.cornerRadius)
                                .frame(width: 249, height: 332)
                        } inProgress: { progress in
                            ZStack{
                                RoundedRectangle(cornerRadius: self.cornerRadius)
                                    .foregroundColor(Color.cardImageLoadingColor)
                                    .frame(width: 249, height: 332)
                                ProgressView()
                            }
                        } failure: { error, retry in
                            // Display error and retry button
                            VStack {
                                Text(error.localizedDescription)
                                Button("Retry", action: retry)
                            }
                        } content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                    }else{
                        Text("wrong imageURL")
                    }
                    

                    
                    VStack{
                        Spacer()
                        Text(self.card.source)
                            .font(Font.cardSourceFont)
                            .foregroundColor(Color.cardSourceColor)
                    }
                    
                }
                .frame(width: 249, height: 332)
                .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
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
