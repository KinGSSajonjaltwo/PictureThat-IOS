//
//  HomeDeckView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/24.
//

import SwiftUI

struct HomeDeckView: View {
    let imageName: String
    let cornerRadius: CGFloat = 15
    let borderWidth: CGFloat = 4
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(Color.white)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .shadow(color: Color.deckShadowColor, radius: 2, x: 0, y: 2)
                
                
                
                Image(self.imageName).resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width - borderWidth*2, height: geo.size.height - borderWidth*2)
                        .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))

                
                
            }
        }
        
    }
}

struct HomeDeckView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDeckView(imageName: "img_heartDeckThumbnail")
            .frame(width: 300,height: 400)
    }
}

extension HomeDeckView{
    static var Sample1: HomeDeckView = HomeDeckView(imageName: "homeThumbNail2")
    static var Sample2: HomeDeckView = HomeDeckView(imageName: "homeThumbNail1")
}

