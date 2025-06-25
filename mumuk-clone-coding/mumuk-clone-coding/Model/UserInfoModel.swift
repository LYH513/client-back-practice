//
//  UserInfoModel.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import Foundation

struct UserInfoModel: Hashable, Identifiable {
    let id: Int
    let userName: String
    let tastePreferences : [String]
    let recentStatus: String
    let yesterdayEaten: String
    let todayTaste: [String]
}

extension UserInfoModel {
    static let mockData: [UserInfoModel] = [
        UserInfoModel(id: 1, userName: "맛있으면 울어", tastePreferences: ["#맵찔이", "#향신료NO", "#오이 NO"], recentStatus: "다이어트", yesterdayEaten: "오코노미야끼", todayTaste: ["🥩육류", "🍞빵", "🇰🇷한식", "🍽️NO국물", "🥘헤비"])
    ]
}
