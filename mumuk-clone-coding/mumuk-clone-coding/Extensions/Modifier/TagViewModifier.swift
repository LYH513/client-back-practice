//
//  TagViewModifier.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import SwiftUI

struct TagViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.pretendardRegular(size: 13))
            .underline(true, pattern: .solid)
            .foregroundColor(Color(red: 1, green: 0.59, blue: 0.1))
    }
}

extension View {
    func applyTagStyle() -> some View {
        self.modifier(TagViewModifier())
    }
}
