//
//  TagGeneratorView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/06/14.
//

import SwiftUI

struct TagGeneratorView: View {
    var tagGeneratorViewModel: TagGeneratorViewModel = TagGeneratorViewModel()
    @State var randomTag: String?
    
    var body: some View {
        ZStack{
            BackGroundView(darkLayerCount: 2)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack{
                
                NavBarView(navBarTitle: "랜덤 포즈 태그")
                Spacer()
                
            }
            
            VStack{
                TagView(tag: randomTag)
            }
            
            VStack{
                Spacer()
                Button {
                    withAnimation {
                        randomTag = tagGeneratorViewModel.getRandomTag()
                    }
                } label: {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.buttonBorderColor)
                            .frame(width: 200, height: 55)
                            .shadow(color: Color.buttonShadowColor, radius: 2, x: 0, y: 2)
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(width: 198, height: 53)
                        
                        Text("태그 생성하기")
                            .font(.deckButtonFont)
                            .foregroundColor(.buttonTextColor)
                        
                    }
                    .padding(.bottom, 70)
                    
                }
                
            }
            
        }
        .task {
            await tagGeneratorViewModel.fetchDecks()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TagGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        TagGeneratorView()
    }
}
