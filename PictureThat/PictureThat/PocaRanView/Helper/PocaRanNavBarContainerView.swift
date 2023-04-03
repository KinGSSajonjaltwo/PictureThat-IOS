//
//  PocaRanNavBarContainerView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/03.
//

import SwiftUI

struct PocaRanNavBarContainerView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0){
            PocaRanNavBarView()
            content.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct PocaRanNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        PocaRanNavBarContainerView {
            ZStack{
                Image("HomewViewBG")
                    .resizable()
                    .ignoresSafeArea()
            }
        }
        
    }
}
