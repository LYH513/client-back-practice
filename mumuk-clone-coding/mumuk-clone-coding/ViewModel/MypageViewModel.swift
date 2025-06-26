//
//  MypageViewModel.swift
//  mumuk-clone-coding
//
//  Created by 이유현 on 6/23/25.
//

import Foundation


final class MypageViewModel: ObservableObject {
    @Published var userData: UserInfoModel = UserInfoModel.mockData
    
    private let userId = 6;
    private let baseUrl = "http://127.0.0.1:8080/api/userinfo"
    
    init(){
        Task {
            await getUserInfo()
        }
    }
    
    func getUserInfo() async {
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
            
            DispatchQueue.main.async {
                self.userData = decodedData
            }
            print("response \(userData)")
        } catch {
            print("🚨ERROR: Network or decoding error - \(error.localizedDescription)")
        }
    }
}
