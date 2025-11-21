//
//  myFunctions.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-09.
//

import Foundation

// Some Characters don't have names, if they don't use the first alias instead
func nameOrAlias(name: String, aliases: [String]) -> String {
    if name.isEmpty && aliases.isEmpty {
        return "Unknown Name"
    } else if name.isEmpty {
        return aliases.first!
    } else {
        return name
    }
}

// Function to return Character Name or Alias from the matching url string
func characterNameFromURL(characters: [IandFCharacter], url: String) -> String {
    if characters.isEmpty {
        return "Unknown Character"
    } else {
        if let character = characters.first(where: { $0.url == url }) {
            return nameOrAlias(name: character.name!, aliases: character.aliases!)
        } else {
            return "Unknown Character"
        }
    }

}

// Function to return the Book Name from the matching url string
func bookNameFromURL(books: [Book], url: String) -> String {
    if books.isEmpty {
        return "Unknown Book"
    } else {
        if let book = books.first(where: { $0.url == url }) {
            return book.name
        } else {
            return "Unknown Book"
        }
    }
}

// Function to return the House Name from the matching url string
func houseNameFromURL(houses: [House], url: String) -> String {
    if houses.isEmpty {
        return "Unknown House"
    } else {
        if let house = houses.first(where: { $0.url == url }) {
            return house.name
        } else {
            return "Unknown House"
        }
    }
}
// Function to convert the API 'ISO8601' released date string to just a date
func convertDate(date: String) -> String {
    var fixedDate = date
    // Insert '00+00:' into the book.released date so it can be parsed by the Swift ISO8601 formatter
    fixedDate.insert(contentsOf: "00+00:", at: date.index(date.endIndex, offsetBy: -2))
    if let newDate = ISO8601DateFormatter().date(from: fixedDate) {
        return newDate.formatted(date: .abbreviated, time: .omitted)
    } else {
        return "Invalid Date"
    }
}
