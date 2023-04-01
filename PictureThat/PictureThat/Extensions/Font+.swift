//
//  Font+.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
//
import SwiftUI

extension Font {
    
    enum NotoSansKr {
        case bold
        case light
        case medium
        case regular
        
        var value: String {
            switch self {
            case .bold:
                return "NotoSansKR-Bold"
            case .light:
                return "NotoSansKR-Light"
            case .medium:
                return "NotoSansKR-Medium"
            case .regular:
                return "NotoSansKR-Regular"
            
            }
        }
    }
    
    static func noto(_ type: NotoSansKr, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
}
