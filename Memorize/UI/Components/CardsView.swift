//
//  CardsView.swift
//  Memorize
//
//  Created by Tiago Silva on 06/05/24.
//

import SwiftUI

struct CardsView: View {
    let cards: [MemorizeGame<String>.Card]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(cards.indices, id: \.self) { index in
                CardView(cards[index])
                    .aspectRatio(1, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
}

#Preview {
    CardsView(cards: [.init(content: "🧠")])
}
