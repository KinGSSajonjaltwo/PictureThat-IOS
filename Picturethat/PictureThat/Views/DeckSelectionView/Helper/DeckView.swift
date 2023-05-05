//
//  DeckView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/05.
//

import SwiftUI

struct DeckView: View {
    var size: CGSize
    let cornerRadius: CGFloat = 15
    let borderWidth: CGFloat = 4
    
    init(width: CGFloat, height: CGFloat) {
        size = CGSize(width: width, height: height)
    }
    
    init(){
        self.init(width: 300, height: 400)
    }
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .fill(Color.white)
                .frame(width: size.width, height: size.height)
                .shadow(color: Color.deckShadowColor, radius: 2, x: 0, y: 2)
            
            Image("img_heartDeckThumbnail")
                .resizable()
                .frame(width: size.width - borderWidth*2, height: size.height - borderWidth*2)
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
            
        }
        
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
