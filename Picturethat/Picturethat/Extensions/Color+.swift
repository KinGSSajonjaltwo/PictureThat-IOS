//
//  Color+.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
//
import SwiftUI

extension Color {
 
    static let black01 = Color(hex: "4A4A4A")
    static let black02 = Color(hex: "595959")
    static let black03 = Color(hex: "3D3D3D")
    static let black04 = Color(hex: "737373")
    
    static let btnEnableColor = Color(hex: "4A4A4A")
    static let btnDisableColor = Color(hex: "4A4A4A" , opacity: 0.2)
    
}


extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
      }
    
    
    init(hex:String , opacity: Double){
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b, opacity: opacity)
    }
    
    
}
