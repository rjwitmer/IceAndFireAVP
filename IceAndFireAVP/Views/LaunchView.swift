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
    let menu: [String] = ["Character Selection:", "Book Selection:", "House Selection:"]
    var body: some View {
        NavigationStack {
            Text("Of Ice and Fire")
                .font(.extraLargeTitle)
            
            NavigationLink {
                CharacterListView()
            } label: {
                Text("Character Selection:")
            }
            NavigationLink {
                HouseListView()
            } label: {
                Text("House Selection:")
            }
            NavigationLink {
                BookListView()
            } label: {
                Text("Book Selection:")
            }

        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
