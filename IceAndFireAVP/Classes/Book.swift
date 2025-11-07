//
//  Book.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import Foundation

class Book: Codable, Identifiable {
    let id: String = UUID().uuidString
    let url: String
    let name: String
    let isbn: String
    let authors: [String]
    let numberOfPages: Int
    let publisher: String
    let country: String
    let mediaType: String
    let released: String
    let characters: [String]
    let povCharacters: [String]
    
    enum CodingKeys: String, CodingKey {
        case url, name, isbn, authors, numberOfPages, publisher, country, mediaType, released, characters, povCharacters
    }
}
