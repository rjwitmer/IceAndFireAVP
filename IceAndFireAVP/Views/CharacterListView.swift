//
//  CharacterListView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import SwiftUI

struct CharacterListView: View {
    @State private var searchText: String = ""
    @State var charactersVM: CharactersVM = CharactersVM()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                List(searchResults) { character in
                    VStack {
                        
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            Text(nameOrAlias(name: character.name!, aliases: character.aliases!))
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
                        Text("Titles: \(searchResults.count) of \(charactersVM.characters.count)")
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button("Load All") {
                            Task {
                                charactersVM.loadAll()
                            }
                        }
                        
                    }
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
                charactersVM.getData()
                print("Data Loaded --> Count: \(charactersVM.characters.count)")
            }
            .padding()
            
            
        }
    }
    var searchResults: [Character] {
        if searchText.isEmpty {
            return charactersVM.characters
        } else {    // There is searchText data
            return charactersVM.characters.filter {
                $0.name!.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview {
    CharacterListView()
}
