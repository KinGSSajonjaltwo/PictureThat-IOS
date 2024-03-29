//
//  HomeView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/02.
//

import SwiftUI
import FirebaseAnalytics

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            
            ZStack{
                
                BackGroundView(darkLayerCount: 1)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    //로고
                    Image("logo")
                        .resizable()
                        .frame(width: 292, height: 151)
                        .scaledToFit()
                        .padding(.top, 30)

                    //대문사진
                    ZStack{
                        
                        ZStack{
                            HomeDeckView.Sample1
                                .frame(width: 171.75, height: 229)
                                .rotationEffect(.degrees(-10))
                                .offset(x:-60)
                            
                            HomeDeckView.Sample2
                                .frame(width: 182.2,height: 243)
                                .rotationEffect(.degrees(10))
                                .offset(x: 60, y: 20)
                        }
                        
                    }
                    .padding(.vertical, 40)
                                  
                    Spacer()
                    //버튼
                    NavigationLink(
                        destination: DeckSelectionView(),
                        label: {
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.buttonBorderColor)
                                    .frame(width: 256, height: 55)
                                    .shadow(color: Color.buttonShadowColor, radius: 2, x: 0, y: 2)
                                
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.white)
                                    .frame(width: 252, height: 51)

                                Text("포즈 카드팩 둘러보기")
                                    .font(.deckButtonFont)
                                    .foregroundColor(.buttonTextColor)
                                
                            }
                        })
                    .padding(.bottom, 30)
                    
                    NavigationLink(
                        destination: TagGeneratorView(),
                        label: {
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.buttonBorderColor)
                                    .frame(width: 256, height: 55)
                                    .shadow(color: Color.buttonShadowColor, radius: 2, x: 0, y: 2)
                                
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.white)
                                    .frame(width: 252, height: 51)

                                Text("랜덤 포즈 태그 생성하기")
                                    .font(.deckButtonFont)
                                    .foregroundColor(.buttonTextColor)
                                
                            }
                        })

                    Spacer()
                    Spacer()
                    
                }
                
            }
            
        }
        .navigationViewStyle(.automatic)
        .preferredColorScheme(.light)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
