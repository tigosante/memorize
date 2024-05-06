//
//  ContentView.swift
//  Memorize
//
//  Created by Tiago Silva on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    private let emojis = ["👨🏻‍🦱", "⚙️", "😍", "🧠", "🛠️", "👨🏻‍🦱", "⚙️", "😍", "🧠", "🛠️", "👨🏻‍🦱", "⚙️", "😍", "🧠", "🛠️", "👨🏻‍🦱", "⚙️", "😍", "🧠", "🛠️"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                CardsView(emojis: emojis, cardCount: $cardCount)
            }
            Spacer()
            CardsCountAjustersView(
                disableAdd: cardCount == emojis.count,
                disableRemove: cardCount == 0,
                cardCount: $cardCount
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
