//
//  ContentView.swift
//  Memorize
//
//  Created by Tiago Silva on 05/05/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemorizeGame
    
    var body: some View {
        VStack {
            ScrollView {
                CardsView(cards: viewModel.cards) { card in
                    viewModel.chooseCard(card)
                }
                .animation(.easeInOut, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: .init())
}
