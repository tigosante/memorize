//
//  CardAddView.swift
//  Memorize
//
//  Created by Tiago Silva on 06/05/24.
//

import SwiftUI

struct CardAddView: View {
    let disable: Bool
    
    @Binding var cardCount: Int
    
    
    var body: some View {
        Button {
            cardCount += 1
        } label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        }
        .disabled(disable)
    }
}

#Preview {
    CardAddView(disable: false, cardCount: .constant(0))
}
