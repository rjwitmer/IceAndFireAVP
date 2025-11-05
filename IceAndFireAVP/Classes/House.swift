//
//  House.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import Foundation

class House {
    private var url: String
    private var name: String
    private var region: String
    private var coatOfArms: String
    private var words: String?
    private var titles: [String]?
    private var seats: [String]?
    private var currentLord: String?
    private var heir: String?
    private var overlord: String?
    private var founded: String?
    private var founder: String?
    private var diedOut: String?
    private var ancestralWeapons: [String]?
    private var cadetBranches: [String]?
    private var swornMembers: [String]?
    
    init(url: String = "", name: String = "", region: String = "", coatOfArms: String = "", words: String? = nil, titles: [String]? = nil, seats: [String]? = nil, currentLord: String? = nil, heir: String? = nil, overlord: String? = nil, founded: String? = nil, founder: String? = nil, diedOut: String? = nil, ancestralWeapons: [String]? = nil, cadetBranches: [String]? = nil, swornMembers: [String]? = nil) {
        self.url = url
        self.name = name
        self.region = region
        self.coatOfArms = coatOfArms
        self.words = words
        self.titles = titles
        self.seats = seats
        self.currentLord = currentLord
        self.heir = heir
        self.overlord = overlord
        self.founded = founded
        self.founder = founder
        self.diedOut = diedOut
        self.ancestralWeapons = ancestralWeapons
        self.cadetBranches = cadetBranches
        self.swornMembers = swornMembers
    }
}
