//
//  TabNavigationView.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/26/25.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing:0){

                switch navigationManager.currentTab {
                case .FindFriend:
                    VStack{
                        Spacer()
                        Text("친구 찾기")
                        Spacer()
                    }
                case .MenuRecommend:
                    VStack{
                        Spacer()
                        Text("메뉴 추천")
                        Spacer()
                    }
                case .Mypage:
                    MypageView()
                }
                
            } //ScrollView
            
            CustomTabView()
            
            
        }//VStack
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TabNavigationView()
        .environmentObject(NavigationManager())
}
