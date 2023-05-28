//
//  ImageLoader.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/28.
//

import Foundation
import SwiftUI

class ImageLoader {
    static func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                completion(nil)
                return
            }
            
            completion(image)
        }.resume()
    }
}
