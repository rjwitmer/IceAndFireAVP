//
//  BookDetailView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-10.
//

import SwiftUI

enum CharacterListType: CaseIterable, Identifiable, CustomStringConvertible {
    case povCharacters
    case characters
    case none
    var id: Self { self }
    var description: String {
        switch self {
        case .povCharacters: return "Point of View Characters"
        case .characters: return "All Characters"
        case .none: return "None"
        }
    }
}

struct BookDetailView: View {
    @Environment(CharactersVM.self) var charactersVM
    let book: Book
    @State private var selectAuthor: Int = 0
    @State private var characterListSelection: CharacterListType = .povCharacters

    var body: some View {
        VStack {
            Text(book.name)
                .font(.largeTitle)
                .padding()
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.fixed(100)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity)),
                        GridItem(.fixed(100)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity))
                    ],
                    alignment: .leading,
                    spacing: 10
                ) {
                    // Description: data
                    Text("Title:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text("\(book.name)")
                    Text("Released:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(convertDate(date: book.released))
                    Text("Author:")
                        .foregroundStyle(.blue)
                        .bold()
                    if book.authors.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectAuthor, label: Text("")) {
                            ForEach(0..<book.authors.count, id: \.self) {
                                Text("\(book.authors[$0])")
                            }
                        }
                    }
                    Text("ISBN:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text(book.isbn)
                    Text("Publisher:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text("\(book.publisher)")
                    Text("Country:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text("\(book.country)")
                    Text("Media Type:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text("\(book.mediaType)")
                    Text("Pages:")
                        .foregroundStyle(.blue)
                        .bold()
                    Text("\(book.numberOfPages)")
                }
                .padding()
            }

            Picker("Character List Selection:", selection: $characterListSelection) {
                ForEach(CharacterListType.allCases) {
                    Text($0.description)
                }
            }
            .pickerStyle(.segmented)
            if characterListSelection == .characters {
                Text("Total \(book.characters.count) Characters in this book:")
                    .foregroundStyle(Color.blue)
                    .font(.headline)
                List(book.characters, id: \.self) { character in
                    Text(characterNameFromURL(characters: charactersVM.characters, url: character))
                }
            } else if characterListSelection == .povCharacters {
                Text("Total \(book.povCharacters.count) Point of View Characters in this book:")
                    .foregroundStyle(Color.blue)
                    .font(.headline)
                List(book.povCharacters, id: \.self) { character in
                    Text(characterNameFromURL(characters: charactersVM.characters, url: character))
                }
            } else {
                Text("Disabled:")
                Rectangle()
                    .opacity(0)
            }
            Spacer()

        }
    }
}

// Intentionally Disabled because of the use @Environment variables
//#Preview {
//    BookDetailView(book: Book(url: "https://anapioficeandfire.com/api/books/1",
//                              name: "A Sample Book",
//                              isbn: "978-00000000000",
//                              authors: ["George R.R. Martin"],
//                              numberOfPages: 999,
//                              publisher: "Sample Publisher",
//                              country: "Canada",
//                              mediaType: "Hardcover",
//                              released: "1996-08-01T00:00:00",
//                              characters: ["Character 1", "Character 2"],
//                              povCharacters: ["Character 1"]))
//}
