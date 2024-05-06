//
//  CardsCountAjustersView.swift
//  Memorize
//
//  Created by Tiago Silva on 06/05/24.
//

import SwiftUI

struct CardsCountAjustersView: View {
    let disableAdd: Bool
    let disableRemove: Bool
    
    @Binding var cardCount: Int
    
    var body: some View {
        HStack {
            CardRemoveView(disable: disableRemove, cardCount: $cardCount)
            Spacer()
            CardAddView(disable: disableAdd, cardCount: $cardCount)
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}

#Preview {
    CardsCountAjustersView(
        disableAdd: false,
        disableRemove: false,
        cardCount: .constant(0)
    )
}
