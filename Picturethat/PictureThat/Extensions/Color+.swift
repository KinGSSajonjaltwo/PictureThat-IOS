//
//  Color+.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
//
import SwiftUI

extension Color {
    
    static let mainTextColor =  Color(hex: "4A4A4A")
    
    static let buttonColor = Color(hex: "FFFFFF")
    static let buttonBorderColor = Color(hex: "4A4A4A")
    static let buttonShadowColor = Color(hex: "000000", opacity: 0.5)
    static let buttonTextColor = Color(hex: "4A4A4A")

    static let deckBorderColor = Color(hex: "FFFFFF")
    static let deckShadowColor = Color(hex: "000000", opacity: 0.5)
    
    static let cardSourceColor = Color(hex: "FFFFFF", opacity: 0.5)
    static let cardTitleColor = Color(hex: "4A4A4A")
    
    static let cardImageLoadingColor = Color(hex: "D9D9D9")
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
