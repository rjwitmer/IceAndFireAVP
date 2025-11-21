//
//  CharacterDetailView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-09.
//

import SwiftUI

struct CharacterDetailView: View {
    @Environment(BooksVM.self) var booksVM
    @Environment(HousesVM.self) var housesVM
    @State private var selectTitle: Int = 0
    @State private var selectAlias: Int = 0
    @State private var selectTVSeries: Int = 0
    @State private var selectActor: Int = 0
    @State private var selectBook: Int = 0
    @State private var selectHouse: Int = 0
    let character: IandFCharacter
    var body: some View {
        VStack {
            Text(nameOrAlias(name: character.name!, aliases: character.aliases!))
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(
                    columns: [
                        //                        GridItem(.fixed(600)),
                        GridItem(.fixed(100)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity)),
                        GridItem(.fixed(100)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity))
                    ],
                    alignment: .leading,
                    spacing: 10
                ) {
                    // Description: data
                    Text("Name:")
                        .foregroundStyle(.blue)
                        .bold()
                    if character.name == nil || character.name!.isEmpty {
                        Text("Unknown")
                    } else {
                        Text(character.name!)
                    }
                    Text("Gender:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.gender ?? "Unknown")
                    Text("Aliases:")
                        .foregroundStyle(.blue)
                        .bold()
                    if character.aliases!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectAlias, label: Text("")) {
                            ForEach(0..<character.aliases!.count, id: \.self) {
                                Text("\(character.aliases![$0])")
                            }
                        }
                    }
                    Text("Titles:")
                        .foregroundStyle(.blue)
                        .bold()
                    if character.titles!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectTitle, label: Text("")) {
                            ForEach(0..<character.titles!.count, id: \.self) {
                                Text("\(character.titles![$0])")
                            }
                        }
                    }
                    Text("Born:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.born ?? "Unknown")
                    Text("Died:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.died ?? "Alive")
                    Text("Father:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.father ?? "Unknown")
                    Text("Mother:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.mother ?? "Unknown")
                    Text("Spouse:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.spouse ?? "Unknown")
                    Text("Culture:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.culture ?? "Unknown")
                    Text("TV Series:")
                        .foregroundStyle(.blue)
                        .bold()
                    if character.tvSeries!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectTVSeries, label: Text("")) {
                            ForEach(0..<character.tvSeries!.count, id: \.self) {
                                Text("\(character.tvSeries![$0])")
                            }
                        }
                    }
                    Text("Played By:")
                        .foregroundStyle(.blue)
                        .bold()
                    if character.playedBy!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectActor, label: Text("")) {
                            ForEach(0..<character.playedBy!.count, id: \.self) {
                                Text("\(character.playedBy![$0])")
                            }
                        }
                    }
                    Text("Books:")
                        .foregroundStyle(.blue)
                        .bold()
                    if character.books!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectBook, label: Text("")) {
                            ForEach(0..<character.books!.count, id: \.self) {
                                Text(bookNameFromURL(books: booksVM.books, url: character.books![$0]))
//                                Text("\(character.books![$0])")
                            }
                        }
                    }
                    Text("Allegiances:")
                        .foregroundStyle(.blue)
                        .bold()
                    if character.allegiances!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectHouse, label: Text("")) {
                            ForEach(0..<character.allegiances!.count, id: \.self) {
                                Text(houseNameFromURL(houses: housesVM.houses, url: character.allegiances![$0]))
//                                Text("\(character.allegiances![$0])")
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

// Intentionally disabled becase of the booksVM environment variable being used
//#Preview {
//    CharacterDetailView(character: Character(url: "https://anapioficeandfire.com/api/characters/1",
//                                             name: "Dante of the Brampton",
//                                             gender: "Male",
//                                             culture: "Canine",
//                                             born: "Sept 11, 2014",
//                                             died: "",
//                                             titles: ["Alpha Male", "The Liver King"],
//                                             aliases: ["Good Boy", "My Buddy"],
//                                             father: "US Champion",
//                                             mother: "Canadian Champion",
//                                             spouse: "",
//                                             allegiances: ["https://anapioficeandfire.com/api/houses/362"],
//                                             books: ["https://anapioficeandfire.com/api/books/5"],
//                                             povBooks: [""],
//                                             tvSeries: [""],
//                                             playedBy: ["Direwolf"]))
//}
