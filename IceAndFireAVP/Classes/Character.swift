//
//  Character.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: String = UUID().uuidString
    let url: String
    let name: String?
    let gender: String?
    let culture: String?
    let born: String?
    let died: String?
    let titles: [String]?
    let aliases: [String]?
    let father: String?
    let mother: String?
    let spouse: String?
    let allegiances: [String]?
    let books: [String]?
    let povBooks: [String]?
    let tvSeries: [String]?
    let playedBy: [String]?
    
    enum CodingKeys: CodingKey {
        case url
        case name
        case gender
        case culture
        case born
        case died
        case titles
        case aliases
        case father
        case mother
        case spouse
        case allegiances
        case books
        case povBooks
        case tvSeries
        case playedBy
    }
}
