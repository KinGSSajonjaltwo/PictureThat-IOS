//
//  TagView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/06/14.
//

import SwiftUI

struct TagView: View {
    
    var tag: String?
    let cornerRadius: CGFloat = 15
    let borderWidth: CGFloat = 4
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .fill(Color.white)
                .frame(width: 286, height: 408)
                .shadow(color: Color.deckShadowColor, radius: 2, x: 0, y: 2)
            
            
            VStack(spacing: 0) {
                
                ZStack {
                    
                    Image("poseGenImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 249, height: 332)
                        .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
                    

                    
                    VStack{
                        Spacer()
                        Text("@cau_picturethat")
                            .font(Font.cardSourceFont)
                            .foregroundColor(Color.cardSourceColor)
                        
                    }
                    
                }
                .frame(width: 249, height: 332)
                .padding(.top, 17)
                
                Spacer()
                
                Text(self.tag ?? "#도전 #포즈 #태그")
                    .font(Font.cardTitleFont)
                    .foregroundColor(Color.cardTitleColor)
                    .padding(.bottom, 17)
                
            }
            
            
        }
        .frame(width: 286, height: 408)
    }
}


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}

