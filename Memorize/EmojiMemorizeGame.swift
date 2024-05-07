//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Tiago Silva on 07/05/24.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    static private let emojis = ["👨🏻‍🦱", "⚙️", "😍", "🧠", "✈️", "✅", "💻"]
    
    @Published private var model = MemorizeGame(numberOfPairsOfCards: 4) { pairIndex in
        return if emojis.indices.contains(pairIndex) {
            emojis[pairIndex]
        } else {
            "⁉️"
        }
    }
    
    var cards: [MemorizeGame<String>.Card] {
        return model.cards
    }
    
    func chooseCard(_ card: MemorizeGame<String>.Card) {
        model.choose(card: card)
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
}
