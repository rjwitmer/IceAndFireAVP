//
//  BookDetailView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-10.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    @State private var selectAuthor: Int = 0
    
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
            .padding()
            Text("Point of View Characters in this book: \(book.povCharacters.count)")
                .foregroundStyle(Color.blue)
                .font(.headline)
            List(book.povCharacters, id: \.self) { character in
                Text(character)
            }
            
            Text("Characters in this book: \(book.characters.count)")
                .foregroundStyle(Color.blue)
                .font(.headline)
            List(book.characters, id: \.self) { character in
                Text(character)
            }
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

#Preview {
    BookDetailView(book: Book(url: "https://anapioficeandfire.com/api/books/1",
                              name: "A Sample Book",
                              isbn: "978-00000000000",
                              authors: ["George R.R. Martin"],
                              numberOfPages: 999,
                              publisher: "Sample Publisher",
                              country: "Canada",
                              mediaType: "Hardcover",
                              released: "1996-08-01T00:00:00",
                              characters: ["Character 1", "Character 2"],
                              povCharacters: ["Character 1"]))
}
