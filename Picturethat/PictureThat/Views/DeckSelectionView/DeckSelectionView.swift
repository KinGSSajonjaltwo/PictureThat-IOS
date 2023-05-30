//
//  DeckSelectionView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/02.
//

import SwiftUI

struct DeckSelectionView: View {
    @State var currentIndex: Int = 0
    
    @StateObject var deckViewModel: DeckViewModel = DeckViewModel()
    
    @State private var isPresented = false
    
    var body: some View {
        
        ZStack{
            Image("img_BackGroundImage")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                NavBarView(navBarTitle: "포즈 카드팩 둘러보기")
                Spacer()
                Button {
                    print("\(currentIndex)")
                    isPresented = true
                } label: {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.buttonBorderColor)
                            .frame(width: 200, height: 55)
                            .shadow(color: Color.buttonShadowColor, radius: 2, x: 0, y: 2)
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(width: 198, height: 53)
                        
                        Text("팩 뜯기")
                            .font(.deckButtonFont)
                            .foregroundColor(.buttonTextColor)
                        
                    }
                    .padding(.bottom, 70)
                    
                }
                .sheet(isPresented: $isPresented) {
                    CardSelectionView(deck: self.deckViewModel.decks[currentIndex])
                }
            }
            
            
            
            GeometryReader { geo in
                VStack(spacing: 0){
                    
                    Spacer()
                    Spacer()
                    
                    Group{
                        DeckListView(index: $currentIndex, items: $deckViewModel.decks) { deck in
                            
                            DeckView(deck: deck)
                            
                        }
                        .frame(height: (geo.size.width - 100)/3*4)
                    }
                    .frame(height: geo.size.height*2/3)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    
                }
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            Task{
                await deckViewModel.fetchDecks()
                deckViewModel.loadImages()
            }
        }
    }
}

struct DeckSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DeckSelectionView()
    }
}
