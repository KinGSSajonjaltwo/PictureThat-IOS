//
//  TagGeneratorViewModel.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/06/14.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAnalytics

class TagGeneratorViewModel{
    
    var tags: [String] = []
    var extractedTagIndices: Set<Int> = []
    
    private let firestore = Firestore.firestore()
    private let poseTagCollection = "posetags"
    
    func fetchDecks() async{
        Analytics.logEvent("TagGeneratorView_Appeared", parameters: [:])
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
        
        let availableIndices = Array(0..<tags.count).filter { !extractedTagIndices.contains($0) }
        
        if availableIndices.isEmpty {
            extractedTagIndices = []
            return getRandomTag()
        }
        
        let randomIndex = availableIndices.randomElement()!
        extractedTagIndices.insert(randomIndex)
        
        return tags[randomIndex]
    }
    
}
