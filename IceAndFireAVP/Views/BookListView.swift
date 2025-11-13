//
//  BookListView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import SwiftUI

struct BookListView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(BooksVM.self) var booksVM
    @Environment(CharactersVM.self) var charactersVM
    @State private var searchText: String = ""
    // booksVM is no an Environment variable passed from LaunchView
//    @State var booksVM: BooksVM = BooksVM()

    
    var body: some View {

        NavigationStack {
            ZStack {
                List(searchResults) { book in
                    VStack {
                        
                        NavigationLink {
                            BookDetailView(book: book)
                                .environment(charactersVM)
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
                .navigationBarBackButtonHidden(true)
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
                // booksVM is now passed from LaunchView as an Environment variable
//                booksVM.getData()
//                print("Data Loaded --> Count: \(booksVM.books.count)")
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

// Intentionally disabled becase booksVM is passed from LaunchView via an @Environment variable and WebApi is not available to Preview
//#Preview {
//    BookListView()
//}
