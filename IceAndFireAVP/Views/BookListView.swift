//
//  BookListView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import SwiftUI

struct BookListView: View {
    @State private var searchText: String = ""
    @State var booksVM: BooksVM = BooksVM()
    
    var body: some View {
        @Environment(\.dismiss) var dismiss
        
        NavigationStack {
            ZStack {
                List(searchResults) { book in
                    VStack {
                        
                        NavigationLink {
                            //                            CharacterDetailView(character: book)
                        } label: {
                            Text(book.name)
                                .font(.title2)
                        }
                        
                        Spacer()
                    }
                    //                    .task {   // Allows lazy loading of the next page during scrolling, but doesn't function well with this API
                    //                        await personsVM.getNextPage()
                    //                    }
                }
                .listStyle(.automatic)
                .navigationTitle(Text("Books:"))
                .toolbar {
                    ToolbarItem(placement: .status) {
                        Text("Titles: \(searchResults.count) of \(booksVM.books.count)")
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        
                    }
                    //                                        ToolbarItem(placement: .bottomBar) {
                    //                                            Button("Load All") {
                    //                                                Task {
                    //                                                    await characterVM.loadAll()
                    //                                                }
                    //                                            }
                    //
                    //                                        }
                    //                                        ToolbarItem(placement: .bottomBar) {
                    //                                            Button("Next Page") {
                    //                                                Task {
                    //                                                    await characterVM.loadNextPage()
                    //                                                }
                    //                                            }
                    //                                        }
                }
                .searchable(text: $searchText)
                
                //            if booksVM.isLoading {
                //                ProgressView()
                //                    .tint(.red)
                //                    .scaleEffect(4.0)
                //            }
            }
            .task {
                booksVM.getData()
                print("Data Loaded --> Count: \(booksVM.books.count)")
            }
            .padding()
            

        }

    }
    
    var searchResults: [Book] {
        if searchText.isEmpty {
            return booksVM.books
        } else {    // There is searchText data
            return booksVM.books.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview {
    BookListView()
}
