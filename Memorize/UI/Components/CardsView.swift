//
//  CardsView.swift
//  Memorize
//
//  Created by Tiago Silva on 06/05/24.
//

import SwiftUI

struct CardsView: View {
    let emojis: [String]
    
    @Binding var cardCount: Int
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

#Preview {
    CardsView(emojis: ["🧠", "👨🏻‍🦱", "⚙️"], cardCount: .constant(3))
}
