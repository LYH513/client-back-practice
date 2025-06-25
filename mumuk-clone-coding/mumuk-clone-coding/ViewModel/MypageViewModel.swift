//
//  MypageViewModel.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import Foundation


final class MypageViewModel: ObservableObject {
    @Published var userData: UserInfoModel
    
    private let userId = 2;
    private let baseUrl = "서버주소"
    
    init(){
        // 서버 연결 X
        userData = UserInfoModel.mockData

        // 서버 연결 O
        /*
         Task {
            await getUserInfo()
         }
         */
    }
    
    private func getUserInfo() async {
        let urlString = baseUrl
        guard let url = URL(string: "\(urlString)/\(userId)") else {
            print("🚨ERROR: invalidURL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("🚨ERROR: Invalid response - status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
                return
            }

            let decodedData = try JSONDecoder().decode(UserInfoModel.self, from: data)
            userData = decodedData
        } catch {
            print("🚨ERROR: Network or decoding error - \(error.localizedDescription)")
        }
    }
}
