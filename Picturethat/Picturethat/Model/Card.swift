//
//  Card.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/04.
//

import Foundation

struct Card: Hashable, Codable{
    
    var name : String
    var imgURL : String
    
    enum CodingKeys: String, CodingKey{
        case name 
        case imgURL = "url"
    }
}
