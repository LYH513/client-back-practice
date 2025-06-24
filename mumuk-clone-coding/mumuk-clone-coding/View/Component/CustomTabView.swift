//
//  CustomTabView.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Spacer()

                // 좌측 버튼
                Button(action:{}){
                    VStack(spacing:0){
                        Image("friend_off")
                            .padding(.bottom, 9)
                        Text("친구 찾기")
                            .foregroundColor(Color(hex:"#A5A4A9"))
                            .font(.pretendardBold(size: 13))
                    }
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()

                // 우측 버튼
                Button(action:{}){
                    VStack(spacing:0){
                        Image("my_on")
                            .padding(.bottom, 9)
                        Text("MY")
                            .foregroundColor(Color(hex:"#FF971A"))
                            .font(.pretendardBold(size: 13))
                    }
                }

                Spacer()
            } // HStack
            .frame(maxWidth: .infinity)
            .padding(.top, 19)
            .padding(.bottom, 51)
            .background(.white)
            .cornerRadius(26)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: -2)

            // 중앙 버튼 - 위로 튀어나오게
            Button(action:{}){
                VStack(spacing:0){
                    VStack(spacing: 0){
                        VStack(spacing: 0){
                            Image("logo")
                        }
                        .frame(width: 60, height: 60)
                        .background(Color(hex:"#FF971A"))
                        .cornerRadius(50)
                    }
                    .frame(width: 75, height: 75)
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: -2)
                    .padding(.bottom, 2)

                    Text("메뉴 추천")
                        .foregroundColor(Color(hex:"#A5A4A9"))
                        .font(.pretendardBold(size: 13))
                }
            }
            .offset(y: -37)
        } // ZStack
    }
}

#Preview {
    CustomTabView()
}
