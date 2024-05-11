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
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: cards.count,
                size: geometry.size,
                atAspectRatio: 2/3
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 95), spacing: 0)], spacing: 0) {
                ForEach(cards) { card in
                    CardView(card)
                        .aspectRatio(1, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            onTapGesture(card)
                        }
                }
            }
            .foregroundColor(.orange).onAppear {
                print(gridItemSize)
            }
        }
    }
    
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        let count = CGFloat (count)
        var columnCount = 1.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
        } while columnCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
    
    #Preview {
        CardsView(
            cards: (1...9).map({ index in .init(content: "🧠", id: "\(index + 1)a") })
        ) { card in print(card) }
    }
}
