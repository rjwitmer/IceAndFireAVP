//
//  LaunchView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State public var characterPage: Int = 1
    @State private var charactersVM: CharactersVM = CharactersVM()
    @State private var housesVM: HousesVM = HousesVM()
    @State private var booksVM: BooksVM = BooksVM()
    let menu: [String] = ["Character Selection:", "Book Selection:", "House Selection:"]
    
    var body: some View {
        ZStack {
            NavigationStack {
                Text("Of Ice and Fire")
                    .font(.extraLargeTitle)
                
                NavigationLink {
                    CharacterListView()
                        .environment(charactersVM)
                        .environment(booksVM)
                        .environment(housesVM)
                } label: {
                    Text("Character Selection:")
                }
                NavigationLink {
                    HouseListView()
                        .environment(charactersVM)
                        .environment(housesVM)
                } label: {
                    Text("House Selection:")
                }
                NavigationLink {
                    BookListView()
                        .environment(charactersVM)
                        .environment(booksVM)
                } label: {
                    Text("Book Selection:")
                }

            }
            if !charactersVM.doneLoading || !housesVM.doneLoading || !booksVM.doneLoading {
                HStack {
                    
                    ProgressView()
                        .tint(Color.red)
                        .scaleEffect(1.0)
                    
                    VStack(alignment: .leading) {
                        if !charactersVM.doneLoading {
                            Text("Loading Character Data...")
                        }
                        if !housesVM.doneLoading {
                            Text("Loading House Data...")
                        }
                        if !booksVM.doneLoading {
                            Text("Loading Book Data...")
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                charactersVM.loadAll()
                housesVM.loadAll()
                booksVM.getData()
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
