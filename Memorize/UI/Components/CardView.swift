//
//  CardView.swift
//  Memorize
//
//  Created by Tiago Silva on 06/05/24.
//

import SwiftUI

struct CardView: View {
    let content: String
    
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture { isFaceUp.toggle() }
    }
}

#Preview {
    CardView(content: "🧠")
}
