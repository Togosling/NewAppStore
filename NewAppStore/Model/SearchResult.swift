//
//  SearchResult.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 16/3/23.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    var trackName: String?
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls : [String]
}
