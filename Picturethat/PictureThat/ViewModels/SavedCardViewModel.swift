//
//  SavedCardViewModel.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/06/03.
//

import Foundation

class SavedCardsViewModel: ObservableObject {
    
    @Published var savedCards: [SavedCard] = []
    
    func saveCards() {
        do {
            let data = try JSONEncoder().encode(savedCards)
            FileManager.default.createFile(atPath: savedCardsFilePath(), contents: data, attributes: nil)
        } catch {
            print("Failed to save cards: \(error)")
        }
    }
    
    
    func loadCards() {
        do {
            let fileURL = savedCardsFilePath()
            let data = try Data(contentsOf: URL(fileURLWithPath: fileURL))
            savedCards = try JSONDecoder().decode([SavedCard].self, from: data)
        } catch {
            print("Failed to load cards: \(error)")
        }
    }
    
    
    private func savedCardsFilePath() -> String {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("savedCards.json").path
    }
    
}

class SavedCardsData: ObservableObject {
    @Published var savedCardsViewModel = SavedCardsViewModel()
}
