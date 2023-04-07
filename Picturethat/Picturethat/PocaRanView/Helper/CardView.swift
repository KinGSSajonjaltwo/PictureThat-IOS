//
//  CardView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/05.
//

import SwiftUI

struct CardView: View, Identifiable{
    
    // MARK: - Properties
    let id = UUID()
    
    var card: Card
    var isTopCard: Bool = false
    
    @State private var offset = CGSize.zero
    @State private var color: Color = .cardColor
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    

    let width : CGFloat = 320
    let height : CGFloat = 420
    let durationAndDelay : CGFloat = 0.3
    
    
    var body: some View {
        ZStack{
            
            CardFront(width: width, height: height, imgURL: card.imgURL, degree: $frontDegree)
            
            CardBack(width: width, height: height, name: card.name, degree: $backDegree)
            
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .onTapGesture {
            flipCard ()
        }

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(name: "#테스트\n#이미지", imgURL: "testCardURL.com"))
    }
}

extension CardView{
    
    func swipeCard(width: CGFloat) {
        switch width{
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    func flipCard () {
        
        if self.isTopCard{
            isFlipped = !isFlipped
            if isFlipped {
                withAnimation(.linear(duration: durationAndDelay)) {
                    backDegree = 90
                }
                withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                    frontDegree = 0
                }
            } else {
                withAnimation(.linear(duration: durationAndDelay)) {
                    frontDegree = -90
                }
                withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                    backDegree = 0
                }
            }
        }
        
    }
    
    
}

struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    let imgURL: String
    @Binding var degree : Double

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.cardColor)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            Image("testPocaImg")
                .resizable()
                .padding()
                .frame(width: width, height: height)
                
            

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    let name: String
    @Binding var degree : Double

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.cardColor)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            Text("\(name)")
                .foregroundColor(Color.cardTextColor)
                .font(.noto(.bold, size: 32))

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}
