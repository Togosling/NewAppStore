//
//  Reviews.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 27/3/23.
//

import Foundation

struct Review: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    var rating: Label
    
    private enum CodingKeys: String, CodingKey{
        case author, title, content
        case rating = "im:rating"
    }
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
}
