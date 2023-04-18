//
//  HomeView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
//

import SwiftUI

struct HomeView: View {
    
    @State private var cardCount: Int = 4
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack{
                    
                    Image("HomewViewBG")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(.all)
                        .frame(width: geo.size.width,height: geo.size.height)
                    
                    VStack{
                        HStack{
                            Image("CameraBig1")
                            Spacer()
                            Image("CameraBig2")
                        }
                        
                        Spacer()
                        
                        HStack{
                            Image("CameraBig3")
                            Spacer()
                            Image("CameraBig4")
                        }
                    }
                    .padding(EdgeInsets(top: geo.size.height * (50 / 844), leading: geo.size.width * (20/390), bottom: geo.size.height * (50 / 844), trailing:  geo.size.width * (20/390)))
                    
                    VStack{
                        
                        HStack{
                            Image("CameraS1")
                            Spacer()
                            Image("CameraS2")
                        }
                        
                        Spacer()
                        
                        Image("CameraCenter")
                        
                        Spacer()
                        
                        HStack{
                            Image("CameraS3")
                            Spacer()
                            Image("CameraS4")
                        }
                        
                    }
                    .padding(EdgeInsets(top: geo.size.height * (353 / 844), leading: geo.size.width * (87/390), bottom: geo.size.height * (353 / 844), trailing:  geo.size.width * (87/390)))
                    
                    VStack{
                        
                        Image("mainLogo")
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(.top, geo.size.height * (130 / 844))
                    
                    
                    VStack(spacing: geo.size.height * (28/844)){
                        Spacer()
                        
                        
                        HStack{
                            
                            Button{
                                cardCount -= 1
                            }label:{
                                
                                Image(systemName: "minus.circle.fill")
                                    .padding(.leading, 15)
                                    .foregroundColor(cardCount == 4 ? .btnDisableColor : .btnEnableColor)
                                
                            }.disabled(cardCount == 4)
                            
                            Spacer()
                            
                            Text("\(cardCount)")
                                .font(.noto(.bold, size: 16))
                                .foregroundColor(Color.black01)
                            
                            Spacer()
                            
                            Button{
                                cardCount += 1
                            }label:{
                                
                                Image(systemName: "plus.circle.fill")
                                    .padding(.trailing, 15)
                                    .foregroundColor(cardCount == 10 ? .btnDisableColor : .btnEnableColor)
                                
                            }.disabled(cardCount == 10)
                            
                        }.foregroundColor(Color.black01)
                            .frame(width: 168, height: 44)
                            .background(Color.white)
                            .cornerRadius(24)
                        
                        
                        
                        NavigationLink {
                            PocaRanView(cardViewModel: CardViewModel(cardCount: self.cardCount))
                        } label: {
                            Text("시작")
                                .font(.noto(.bold, size: 16))
                                .foregroundColor(Color.black01)
                                .frame(width: 168, height: 44)
                                .background(Color.white)
                                .cornerRadius(24)
                        }
                        
                        
                        
                        
                    }.padding(.bottom, geo.size.height * (120/844))
                    
                    
                    
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .previewDisplayName("iPhone 14")
            
            HomeView()
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
                .previewDisplayName("iPad Pro (12.9-inch) (6th generation)")
            
            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
                .previewDisplayName("iPhone 14 Pro")
            
            HomeView()
                .previewDevice("iPhone SE (3rd generation)")
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            
        }
    }
}
