//
//  TokenViewModifier.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import SwiftUI

struct TokenViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.pretendardRegular(size: 13))
            .foregroundColor(Color(hex:"#FF971A"))
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .background(.white)
            .cornerRadius(14.5)
            .overlay(
                RoundedRectangle(cornerRadius: 14.5)
                .inset(by: 0.5)
                .stroke(Color(red: 1, green: 0.59, blue: 0.1), lineWidth: 1)
            )
    }
}

extension View {
    func applyTokenStyle() -> some View {
        self.modifier(TokenViewModifier())
    }
}
