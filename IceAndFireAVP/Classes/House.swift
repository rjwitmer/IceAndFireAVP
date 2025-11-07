//
//  House.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import Foundation

class House: Codable, Identifiable {
    let id: String = UUID().uuidString
    let url: String
    let name: String
    let region: String
    let coatOfArms: String
    let words: String?
    let titles: [String]?
    let seats: [String]?
    let currentLord: String?
    let heir: String?
    let overlord: String?
    let founded: String?
    let founder: String?
    let diedOut: String?
    let ancestralWeapons: [String]?
    let cadetBranches: [String]?
    let swornMembers: [String]?
    
    enum CodingKeys: String, CodingKey {
        case url, name, region, coatOfArms, words, titles, seats, currentLord, heir, overlord, founded, founder, diedOut, ancestralWeapons, cadetBranches, swornMembers
    }
}
