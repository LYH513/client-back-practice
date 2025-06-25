//
//  MypageView.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import SwiftUI

struct MypageView: View {
    
    @State private var help = ["고객센터", "서비스 이용 약관", "로그아웃"]
    @State private var chipsContainerHeight: CGFloat = 0 // 칩뷰 flowlayout
    
    enum MyMenu {
        case recentStatus
        case todayKeyword
        case helper
    }
    
    private let menus: [MyMenu] = [
        .recentStatus,
        .todayKeyword,
        .helper
    ]
    
    var body: some View {
            ScrollView{
                HeaderView()
                
                VStack(spacing: 30){
                    ForEach(menus, id:\.self) { menu in
                        switch menu {
                        case .recentStatus:
                            recentStatus
                        case .todayKeyword:
                            todayKeyword
                        case .helper:
                            helper
                        }
                    }//ForEach
                } //VStack
                .padding(.top, 29)
            } //ScrollView
    }
    
    //MARK: - 컨테이너 뷰 UI
    private var recentStatus: some View {
        HStack(spacing: 0){
            Text("요즘 나의 상태는")
                .foregroundColor(Color(hex: "#4D4D4D"))
                .font(.pretendardMedium(size: 17))
            
            Spacer()
            
            Text(UserInfoModel.mockData[0].recentStatus)
                .applyTokenStyle()
        } //HStack
        .padding(.vertical, 25)
        .applyShadowVStackStyle()
    }
    
    private var todayKeyword: some View {
        VStack(spacing: 0){
            HStack{
                Text("어제 먹은 음식")
                    .foregroundColor(Color(hex: "#4D4D4D"))
                    .font(.pretendardMedium(size: 17))
                
                Spacer()
                
                Text(UserInfoModel.mockData[0].yesterdayEaten)
                    .bold()
                    .applyTokenStyle()
                
            } // HStack
            .padding(.bottom, 37.5)
            
            Divider()
                .frame(height: 2)
                .background(Color(hex: "#EDEDED"))
                .padding(.bottom, 33)
            
            HStack(spacing:0){
                Text("오늘의 입맛 키워드")
                    .foregroundColor(Color(hex: "#4D4D4D"))
                    .font(.pretendardMedium(size: 17))
                
                Spacer()
            }
            .padding(.bottom, 24)
            
            ChipsContainerView(
                totalHeight: $chipsContainerHeight, verticalSpacing: 8,
                horizontalSpacing: 12,
                items: UserInfoModel.mockData[0].todayTaste,
            )
            .frame(height: chipsContainerHeight)
            
        } //VStack
        .padding(.vertical, 27)
        .applyShadowVStackStyle()
    }
    
    private var helper: some View {
        VStack(alignment: .leading,spacing: 21){
            HStack(spacing: 0){
                Text("도움말")
                    .foregroundColor(Color(hex: "#4D4D4D"))
                    .font(.pretendardMedium(size: 17))
                
            } //HStack
            
            ForEach(help, id:\.self){ row in
                VStack(spacing: 0){
                    HStack{
                        if row == "고객센터" {
                            Image("sound")
                        } else if row == "서비스 이용 약관"{
                            Image("guide")
                                .resizable()
                                .frame(width: 14, height: 14)
                        } else {
                            Image("logout")
                                .resizable()
                                .frame(width: 14, height: 14)
                        }
                        
                        Text(row)
                            .font(.pretendardMedium(size: 14))
                    }
                } //VStack
            } //ForEach
        } //VStack
        .padding(.top, 33)
        .padding(.bottom, 39)
        .applyShadowVStackStyle()
    }
}

#Preview {
    MypageView()
}
