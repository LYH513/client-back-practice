//
//  ShadowVStackModifier.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import SwiftUI

struct ShadowVStackModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 27)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 1)
            .padding(.horizontal, 32)
    }
}

extension View {
    func applyShadowVStackStyle() -> some View {
        self.modifier(ShadowVStackModifier())
    }
}
