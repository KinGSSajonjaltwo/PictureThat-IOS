//
//  TagGeneratorViewModel.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/06/14.
//

import SwiftUI
import FirebaseFirestore

class TagGeneratorViewModel{
    
    var tags: [String] = []
    
    private let firestore = Firestore.firestore()
    private let poseTagCollection = "posetags"
    
    func fetchDecks() async{
        
        do {
            let snapshot = try await firestore.collection(poseTagCollection).getDocuments()
            let tags = snapshot.documents.compactMap { $0["name"] as? String }
            
            DispatchQueue.main.async {
                self.tags = tags
            }
        } catch {
            print("Error fetching decks: \(error)")
        }
    }
    
    func getRandomTag() -> String? {
        guard !tags.isEmpty else {
            return nil
        }
        let randomIndex = Int.random(in: 0..<tags.count)
        return tags[randomIndex]
    }
    
}
