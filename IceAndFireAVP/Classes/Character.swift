//
//  Character.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import Foundation

struct Character {
    private var url: String
    private var name: String?
    private var gender: String?
    private var culture: String?
    private var born: String?
    private var died: String?
    private var titles: [String]?
    private var aliases: [String]?
    private var father: String?
    private var mother: String?
    private var spouse: String?
    private var allegiances: [String]?
    private var books: [String]?
    private var povBooks: [String]?
    private var tvSeries: [String]?
    private var playedBy: [String]?
    
    init(url: String = "", name: String? = nil, gender: String? = nil, culture: String? = nil, born: String? = nil, died: String? = nil, titles: [String]? = nil, aliases: [String]? = nil, father: String? = nil, mother: String? = nil, spouse: String? = nil, allegiances: [String]? = nil, books: [String]? = nil, povBooks: [String]? = nil, tvSeries: [String]? = nil, playedBy: [String]? = nil) {
        self.url = url
        self.name = name
        self.gender = gender
        self.culture = culture
        self.born = born
        self.died = died
        self.titles = titles
        self.aliases = aliases
        self.father = father
        self.mother = mother
        self.spouse = spouse
        self.allegiances = allegiances
        self.books = books
        self.povBooks = povBooks
        self.tvSeries = tvSeries
        self.playedBy = playedBy
    }
}
