//
//  CardsView.swift
//  Memorize
//
//  Created by Tiago Silva on 06/05/24.
//

import SwiftUI

struct CardsView: View {
    let onTapGesture: (_ card: MemorizeGame<String>.Card) -> Void
    let cards: [MemorizeGame<String>.Card]
    
    init(cards: [MemorizeGame<String>.Card], onTapGesture: @escaping (_: MemorizeGame<String>.Card) -> Void) {
        self.cards = cards
        self.onTapGesture = onTapGesture
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(cards) { card in
                CardView(card) { cardSelected in
                    onTapGesture(cardSelected)
                }
                    .aspectRatio(1, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
}

#Preview {
    CardsView(cards: [.init(content: "🧠", id: "1a")]) { card in
        print(card)
    }
}
