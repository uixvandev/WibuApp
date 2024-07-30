//
//  Anime.swift
//  Wibu App
//
//  Created by irfan wahendra on 23/07/24.
//

import Foundation

struct Anime: Identifiable, Decodable {
    var id = UUID()
    let img, anime, name: String
    
    enum CodingKeys: String, CodingKey {
            case img = "image"
            case anime, name
        }
}
