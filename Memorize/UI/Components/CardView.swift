//
//  CardView.swift
//  Memorize
//
//  Created by Tiago Silva on 06/05/24.
//

import SwiftUI

struct CardView: View {
    private let onTapGesture: (_ card: MemorizeGame<String>.Card) -> Void
    private let card: MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card, onTapGesture: @escaping (_ card: MemorizeGame<String>.Card) -> Void) {
        self.card = card
        self.onTapGesture = onTapGesture
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        .onTapGesture {
            onTapGesture(card)
        }
    }
}

#Preview {
    CardView(.init(content: "🧠", id: "1a")) { card in
        print(card)
    }
}
