//
//  AnimeListViewModel.swift
//  Wibu App
//
//  Created by irfan wahendra on 23/07/24.
//

import Foundation

@MainActor
class AnimeListViewModel:ObservableObject {
    @Published var animeList : [Anime] = []
    
    func fetchAnime() async {
        do {
            let loadedAnime = try await APIService.shared.fetchAllAnime()
            self.animeList = loadedAnime
            
        } catch {
            print(error)
        }
    }
}
