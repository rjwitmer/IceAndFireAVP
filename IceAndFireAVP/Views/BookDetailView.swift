//
//  BookDetailView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-10.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
                              released: "Dec 25, 2024",
                              characters: ["Character 1", "Character 2"],
                              povCharacters: ["Character 1"]))
}
