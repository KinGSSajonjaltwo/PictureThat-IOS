//
//  BackGroundView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/31.
//

import SwiftUI

struct BackGroundView: View {
    
    let darkLayerCount: Int
    
    init(darkLayerCount: Int = 1) {
        self.darkLayerCount = darkLayerCount
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "35448E"), Color(hex: "0D0D49")]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            
            ForEach(0..<darkLayerCount) { _ in
                DarkLayerView()
            }
            
        }
        
    }
    
    struct DarkLayerView: View{
        var body: some View {
            GeometryReader { geometry in
                RadialGradient(
                    gradient: Gradient(stops: [
                        Gradient.Stop(color: Color(hex: "FFFFFF").opacity(0), location: 0),
                        Gradient.Stop(color: Color(hex: "000000").opacity(0.2), location: 1)
                    ]),
                    center: UnitPoint(x: 0.5, y: 0.5),
                    startRadius: 0,
                    endRadius: geometry.size.width * 0.5
                )
                .aspectRatio(1.0, contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height)
            }

        }
    }
    
}


struct BackGroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundView()
    }
}

