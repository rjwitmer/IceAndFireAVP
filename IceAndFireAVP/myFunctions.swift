//
//  myFunctions.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-09.
//

import Foundation

func nameOrAlias(name: String, aliases: [String]) -> String {
    if name.isEmpty && aliases.isEmpty {
        return "Unknown Name"
    } else if name.isEmpty {
        return aliases.first!
    } else {
        return name
    }
}
