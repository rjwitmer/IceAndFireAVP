//
//  Book.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import Foundation

class Book {
    private var url: String
    private var name: String
    private var isbn: String
    private var authors: [String]
    private var numberOfPages: Int
    private var publisher: String
    private var country: String
    private var mediaType: String
    private var released: String
    private var character: [String]
    private var povCharacters: [String]
    
    init(url: String = "", name: String = "", isbn: String = "", authors: [String] = [], numberOfPages: Int = 0, publisher: String = "", country: String = "", mediaType: String = "", released: String = "", character: [String] = [], povCharacters: [String] = []) {
        self.url = url
        self.name = name
        self.isbn = isbn
        self.authors = authors
        self.numberOfPages = numberOfPages
        self.publisher = publisher
        self.country = country
        self.mediaType = mediaType
        self.released = released
        self.character = character
        self.povCharacters = povCharacters
    }
}
