//
//  APIService.swift
//  Wibu App
//
//  Created by irfan wahendra on 23/07/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init(){}
    
    func fetchAllAnime() async throws -> [Anime] {
        let urlString = URL(string: Constants.animeApi)
        
        guard let url = urlString else {
            print("🙁 Error: Could not convert \(urlString?.absoluteString ?? "uknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("🔄 Fetching data from: \(url)")
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let animes = try JSONDecoder().decode([Anime].self, from: data)
        
        return animes
        
    }
}
