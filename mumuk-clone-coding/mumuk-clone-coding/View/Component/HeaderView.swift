//
//  HeaderView.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import SwiftUI

struct HeaderView: View {
    
    @ObservedObject var viewModel: MypageViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing:0){
            Text("MY")
                .font(.pretendardBold(size: 22))
                .padding(.bottom, 21.36)
            
            HStack(spacing:0){
                VStack(alignment: .leading, spacing:0){
                    Text("\(viewModel.userData.username)")
                        .font(.pretendardBold(size: 25))
                    
                    HStack(spacing: 5){
                        ForEach(viewModel.userData.tastePreferences, id: \.self){ item in
                            Text("\(item)")
                                .applyTagStyle()
                        }
                    } // HStack
                    .padding(.bottom, 12)
                    
                    Text("고유입맛 수정하기>")
                        .foregroundColor(Color(hex: "#B9B9B9"))
                        .underline(true, pattern: .solid)
                        .font(.pretendardMedium(size: 12))
                    
                } // VStack
                
                Spacer()
                    .frame(width: 62)
                
                Image("logoDog")
                    .frame(width: 51, height: 48.74908)
                    .background(
                        Circle()
                            .fill(Color(.sRGB, red: 255/255, green: 151/255, blue: 26/255, opacity: 0.2))
                            .stroke(Color(hex: "#FF971A"), lineWidth: 3)
                            .frame(width: 80.31346, height: 79.10803)
                            .overlay(
                                    Circle()
                                        .fill(Color.white)
                                        .stroke(Color(hex: "#FF971A"), lineWidth: 3)
                                        .frame(width: 21, height: 21)
                                        .overlay(
                                            Image(systemName: "plus")
                                                .foregroundColor(Color(hex: "#FF971A"))
                                                .font(.system(size: 15))
                                        ),
                                    alignment: .bottomTrailing)
                    ) // background
                    
            } // HStack
            .padding(.bottom, 58.64)
            
        } // VStack
        .frame(maxWidth: .infinity)
        .padding(.top, 6)
        .background(Color.white)
        .cornerRadius(50)
        .shadow(color: .black.opacity(0.1), radius: 3.5, x: 0, y: 5)
    }
}

#Preview {
    HeaderView(viewModel: MypageViewModel())
}
