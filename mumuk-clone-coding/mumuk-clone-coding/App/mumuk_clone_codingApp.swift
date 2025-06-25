//
//  mumuk_clone_codingApp.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import SwiftUI

enum ViewType: Hashable {
        case FindFriend
        case MenuRecommend
        case Mypage
}

final class NavigationManager: ObservableObject {
    @Published var currentTab: ViewType = .Mypage
}

@main
struct mumuk_clone_codingApp: App {
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            TabNavigationView()
                .environmentObject(navigationManager)
        }
    }
}
