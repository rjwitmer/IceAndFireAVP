//
//  CharacterDetailView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-09.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var body: some View {
        VStack {
            Text(nameOrAlias(name: character.name!, aliases: character.aliases!))
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(
                    columns: [
                        //                        GridItem(.fixed(600)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity))
                    ],
                    alignment: .leading,
                    spacing: 10
                ) {
                    // Description: data
                    Text("Name:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.name ?? "Unknown")
                    Text("Gender:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.gender ?? "Unknown")
                    Text("Culture:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.culture ?? "Unknown")
                    Text("Born:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.born ?? "Unknown")
                    Text("Died:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(character.died ?? "Alive")
                    Text("Titles:")
                        .foregroundStyle(.blue)
                        .bold()
//                    Text("\(character.titles?.count ?? 0)")
                    if character.titles!.count == 0 {
                        Text("None")
                    } else {
                        List(character.titles!, id: \.self) { title in
                            Text(title)
                        }
                    }
                    Text("Aliases:")
                        .foregroundStyle(.blue)
                        .bold()
                    if character.aliases!.count == 0 {
                        Text("None")
                    } else {
                        List(character.aliases!, id: \.self) { alias in
                            Text(alias)
                        }
                    }

                }
            }
            .padding()
        }
    }
}

#Preview {
    CharacterDetailView(character: Character(url: "https://anapioficeandfire.com/api/characters/1",
                                             name: "Dante of the Brampton",
                                             gender: "Male",
                                             culture: "Canine",
                                             born: "Sept 11, 2014",
                                             died: "",
                                             titles: ["Alpha Male", "The Liver King"],
                                             aliases: ["Good Boy", "My Buddy"],
                                             father: "US Champion",
                                             mother: "Canadian Champion",
                                             spouse: "",
                                             allegiances: ["https://anapioficeandfire.com/api/houses/362"],
                                             books: ["https://anapioficeandfire.com/api/books/5"],
                                             povBooks: [""],
                                             tvSeries: [""],
                                             playedBy: ["Direwolf"]))
}
