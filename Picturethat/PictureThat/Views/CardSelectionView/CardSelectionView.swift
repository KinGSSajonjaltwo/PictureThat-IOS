//
//  CardSelectionView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/25.
//

import SwiftUI

struct CardSelectionView: View {
    var deck: Deck
    @StateObject var cardsViewModel: CardsViewModel = CardsViewModel()
    
    @State private var showingShareSheet = false
    @State private var showingAlert = false
    
    var body: some View {
        
        ZStack{
            
            BackGroundView(darkLayerCount: 4)
                .ignoresSafeArea()
            
            SparkleView()
            
            VStack{
                Capsule()
                    .fill(Color.white)
                    .frame(width: 40, height: 5)
                    .opacity(0.5)
                    .padding(10)
                Spacer()
            }
            
            VStack{
                CardListView(deck: self.deck, cardsViewModel: self.cardsViewModel)
                Button {
                    
                    if cardsViewModel.fetchCompleted{
                        showingShareSheet = true
                    }else{
                        showingAlert = true
                    }

                    
                } label: {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.buttonBorderColor)
                            .frame(width: 256, height: 55)
                            .shadow(color: Color.buttonShadowColor, radius: 2, x: 0, y: 2)
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(width: 252, height: 51)
                        
                        
                        HStack{
                            
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.buttonTextColor)
                            
                            Text("공유하기")
                                .font(.deckButtonFont)
                                .foregroundColor(.buttonTextColor)
                            
                        }
                        
                    }
                }
                .padding(.top, 20)
                .alert(isPresented: $showingAlert) {
                    
                    Alert(title: Text("포즈 카드가 로딩중입니다.\n 다시 시도해주세요"), dismissButton: .default(Text("확인")))
                    
                }
                .sheet(isPresented: $showingShareSheet) {
                    
                    if let image = createFourCutImage() {
                        ShareSheet(activityItems: [image])
                    }
                    
                }
            }
        }
        .task{
            await cardsViewModel.fetchCards(deckID: deck.id)
            cardsViewModel.loadImages()
        }
        
    }
    
    private func createFourCutImage() -> UIImage? {
        
        guard cardsViewModel.fetchCompleted else {
            return nil
        }
        let size = CGSize(width: 139, height: 186)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 317, height: 408))
        
        let image = renderer.image { ctx in
            let bgFrame = CGRect(x: 0, y: 0, width: 317, height: 408)
            UIImage(named: "CardContainer")?.draw(in: bgFrame)
            
            let rect1 = CGRect(origin: CGPoint(x: 17, y: 16), size: size)
            let rect2 = CGRect(origin: CGPoint(x: 17, y: 206), size: size)
            let rect3 = CGRect(origin: CGPoint(x: 160, y: 16), size: size)
            let rect4 = CGRect(origin: CGPoint(x: 160, y: 206), size: size)
            
            cardsViewModel.cards[0].image?.draw(in: rect1)
            cardsViewModel.cards[1].image?.draw(in: rect2)
            cardsViewModel.cards[2].image?.draw(in: rect3)
            cardsViewModel.cards[3].image?.draw(in: rect4)
            
        }

        
        return image
    }
}

struct CardSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardSelectionView(deck: Deck.sampleDeck1)
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {
        // No need to update the view controller
    }
}
