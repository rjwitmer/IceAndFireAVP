//
//  HouseDetailView.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-10.
//

import SwiftUI

struct HouseDetailView: View {
    let house: House
    @State private var selectTitle: Int = 0
    @State private var selectSeat: Int = 0
    @State private var selectAncestralWeapon: Int = 0
    @State private var selectCadetBranch: Int = 0
    
    var body: some View {
        VStack {
            Text(house.name)
                .font(.largeTitle)
                .padding()
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.fixed(120)),
                        GridItem(.flexible(minimum: 50, maximum: .infinity)),
                    ],
                    alignment: .leading,
                    spacing: 10 )
                {
                    // Description
                    Text("Name:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.name)
                    
                    // Description
                    Text("Region:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.region)
                    
                    // Description
                    Text("Coat of Arms:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.coatOfArms)
                    
                    // Description
                    Text("Words:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.words ?? "Unknown")
                    
                    // Description
                    Text("Titles")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    if house.titles!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectTitle, label: Text("")) {
                            ForEach(0..<house.titles!.count, id: \.self) {
                                Text("\(house.titles![$0])")
                            }
                        }
                    }
                    
                    // Description
                    Text("Seats")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    if house.seats!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectSeat, label: Text("")) {
                            ForEach(0..<house.seats!.count, id: \.self) {
                                Text("\(house.seats![$0])")
                            }
                        }
                    }
                    
                    // Description
                    Text("Current Lord:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.currentLord ?? "Unknown")
                    
                    // Description
                    Text("Heir:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.heir ?? "Unknown")
                    
                    // Description
                    Text("Overlord:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.overlord ?? "Unknown")
                    
                    // Description
                    Text("Founder:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.founder ?? "Unknown")
                    
                    // Description
                    Text("Founded:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.founded ?? "Unknown")
                    
                    // Description
                    Text("Died Out:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    Text(house.diedOut ?? "Unknown")
                    
                    // Description
                    Text("Ancestral Weapons:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    if house.ancestralWeapons!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectAncestralWeapon, label: Text("")) {
                            ForEach(0..<house.ancestralWeapons!.count, id: \.self) {
                                Text("\(house.ancestralWeapons![$0])")
                            }
                        }
                    }
                    
                    // Description
                    Text("Cadet Branches:")
                        .foregroundStyle(.blue)
                        .bold()
                    // Data
                    if house.cadetBranches!.count == 0 {
                        Text("None")
                    } else {
                        Picker(selection: $selectCadetBranch, label: Text("")) {
                            ForEach(0..<house.cadetBranches!.count, id: \.self) {
                                Text("\(house.cadetBranches![$0])")
                            }
                        }
                    }
                    
                    Text("Sworn Members: \(house.swornMembers!.count)")
                        .foregroundStyle(Color.blue)
                        .font(.headline)
                    List(house.swornMembers!, id: \.self) { swornMember in
                        Text(swornMember)
                    }
                    
                }
                
                
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    HouseDetailView(house: House(url: "https://anapioficeandfire.com/api/houses/1",
                                 name: "Sample House",
                                 region: "Sample Region",
                                 coatOfArms: "A very long description of the coat of arms listing many distinguishing details",
                                 words: "",
                                 titles: ["Title 1", "Title 2"],
                                 seats: ["Seat 1", "Seat 2"],
                                 currentLord: "",
                                 heir: "",
                                 overlord: "https://anapioficeandfire.com/api/houses/229",
                                 founded: "",
                                 founder: "",
                                 diedOut: "", ancestralWeapons: [],
                                 cadetBranches: [],
                                 swornMembers: ["https://anapioficeandfire.com/api/characters/1", "https://anapioficeandfire.com/api/characters/2"]))
}
