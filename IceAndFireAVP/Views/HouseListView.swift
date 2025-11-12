//
//  HouseListView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-05.
//

import SwiftUI

struct HouseListView: View {
    @State private var searchText: String = ""
    @State var housesVM: HousesVM = HousesVM()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(searchResults) { house in
                    VStack {
                        
                        NavigationLink {
                            HouseDetailView(house: house)
                        } label: {
                            Text(house.name)
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
                        Text("Titles: \(searchResults.count) of \(housesVM.houses.count)")
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
                housesVM.getData()
                print("Data Loaded --> Count: \(housesVM.houses.count)")
            }
            .padding()
            

        }
    }
    var searchResults: [House] {
        if searchText.isEmpty {
            return housesVM.houses
        } else {    // There is searchText data
            return housesVM.houses.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview {
    HouseListView()
}
