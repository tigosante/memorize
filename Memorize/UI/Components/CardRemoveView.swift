//
//  CardRemoveView.swift
//  Memorize
//
//  Created by Tiago Silva on 06/05/24.
//

import SwiftUI

struct CardRemoveView: View {
    let disable: Bool
    
    @Binding var cardCount: Int
    
    var body: some View {
        Button  {
            if cardCount > 0 {
                cardCount -= 1
            }
        } label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        }.disabled(disable)
    }
}

#Preview {
    CardRemoveView(disable: false, cardCount: .constant(0))
}
