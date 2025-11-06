//
//  Book.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import Foundation

class Book: Codable, Identifiable {
    let url: String
    let name: String
//    var isbn: String
//    var authors: [String]
//    var numberOfPages: Int
//    var publisher: String
//    var country: String
//    var mediaType: String
//    var released: String
//    var character: [String]
//    var povCharacters: [String]
    init(url: String = "", name: String = "") {
        self.url = url
        self.name = name
    }
//    init(url: String = "", name: String = "", isbn: String = "", authors: [String] = [], numberOfPages: Int = 0, publisher: String = "", country: String = "", mediaType: String = "", released: String = "", character: [String] = [], povCharacters: [String] = []) {
//        self.url = url
//        self.name = name
//        self.isbn = isbn
//        self.authors = authors
//        self.numberOfPages = numberOfPages
//        self.publisher = publisher
//        self.country = country
//        self.mediaType = mediaType
//        self.released = released
//        self.character = character
//        self.povCharacters = povCharacters
//    }
}
