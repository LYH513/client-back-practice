//
//  ChipsContainerView.swift
//  WheelGo
//
//  Created by 이유현 on 2/17/25.
//

import SwiftUI

struct ChipsContainerView: View {
    
    @Binding var totalHeight: CGFloat
    let verticalSpacing: CGFloat
    let horizontalSpacing: CGFloat
    let items: [String]

    
    init(
        totalHeight: Binding<CGFloat>,
        verticalSpacing: CGFloat = 12,
        horizontalSpacing: CGFloat = 8,
        items: [String]
    ) {
        self._totalHeight = totalHeight
        self.verticalSpacing = verticalSpacing
        self.horizontalSpacing = horizontalSpacing
        self.items = items
    }
    
    public var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        GeometryReader { geomety in
            ZStack(alignment: .topLeading) {
                ForEach(self.items, id: \.self) { item in
                    ChipsView(name: item)
                        .id(item)
                        .alignmentGuide(.leading) { view in
                            if abs(width - view.width) > geomety.size.width {
                                width = 0
                                height -= view.height
                                height -= verticalSpacing
                            }
                            let result = width
                            
                            if item == items.last {
                                width = 0
                            } else {
                                width -= view.width
                                width -= horizontalSpacing
                            }
                            
                            return result
                        }
                        .alignmentGuide(.top) { _ in
                            let result = height
                            
                            if item == items.last {
                                height = 0
                            }
                            return result
                        }
                    
                } // : ForEach
            } // : ZStack
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            DispatchQueue.main.async {
                                self.totalHeight = geometry.size.height
                            }
                        }
                        .onChange(of: items) { _ in
                            DispatchQueue.main.async {
                                self.totalHeight = geometry.size.height
                            }
                        }
                }
            )
        } // :GeometryReader
    }
}

struct ChipsView : View {
    
    let name: String
    
    var body: some View {
        Text("\(name)")
            .font(.pretendardRegular(size: 13))
            .foregroundColor(Color(hex:"#FF971A"))
            .padding(.horizontal, 9)
            .padding(.vertical, 6)
            .background(.white)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 14.5)
                .inset(by: 0.5)
                .stroke(Color(hex: "#FF971A")
            )
                )
    }
}
