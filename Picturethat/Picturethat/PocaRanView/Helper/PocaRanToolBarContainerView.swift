//
//  PocaRanNavBarContainerView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/03.
//

import SwiftUI

struct PocaRanToolBarContainerView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        
        ZStack{
            
            Image("PocaRanViewBG")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                PocaRanNavBarView()
                content.frame(maxWidth: .infinity, maxHeight: .infinity)
                PocaRanControlBarView()
            }
            
        }
        
        
    }
}

struct PocaRanToolBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        PocaRanToolBarContainerView {
            VStack{
                
            }
        }
        
    }
}
