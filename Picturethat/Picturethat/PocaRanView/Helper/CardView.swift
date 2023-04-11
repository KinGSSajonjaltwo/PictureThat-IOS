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
    
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = true
    
    let width : CGFloat = 320
    let height : CGFloat = 420
    let durationAndDelay : CGFloat = 0.3
    
    var body: some View {
        ZStack{
            
            CardBack(width: width, height: height, name: card.name, degree: $backDegree)
            
            CardFront(width: width, height: height, imgURL: card.imgURL, degree: $frontDegree)
            
        }
        .onTapGesture {
            flipCard ()
        }

    }
    
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(name: "#테스트\n#이미지", imgURL: "https://firebasestorage.googleapis.com/v0/b/picturethat-9f8ae.appspot.com/o/ver1%2Fver1-1.png?alt=media&token=c382a1f6-79cd-4df3-898d-ee46f3221a5a"), isTopCard: true)
    }
}

extension CardView{
    
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
            
            PocaImage
                
            

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
    
    var PocaImage: some View {
        AsyncImage(url: URL(string: self.imgURL)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .padding()
                    .frame(width: self.width, height: self.height)
            }else if phase.error != nil{
                Image(systemName: "questionmark.square.dashed")
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .padding()
                    .frame(width: self.width, height: self.height)
                
            }else {
//                RoundedRectangle(cornerRadius: 10)
//                    .foregroundColor(.clear)
//                    .padding()
//                    .frame(width: self.width, height: self.height)
                ProgressView()
                    .foregroundColor(Color.black01)
            }
        }
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
