//
//  HousesVM.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-07.
//

import Foundation

@Observable
class HousesVM {
    var houses: [House] = []
    var doneLoading: Bool = false
    var errorMessage: String?
    
    var networkService: NetworkService = NetworkService()
    var isLoading: Bool = false
    
    func getData() {
        guard !doneLoading else { return }
        self.isLoading = true
        
        Task {
            do {
                let decodedData = try await networkService.fetchHouseData()
                DispatchQueue.main.async {
                    if decodedData.count == 0 {
                        self.doneLoading = true
                        print("😡 ERROR: No API data")
                    } else {
                        print("👻 Got data")
                        
                        self.houses = self.houses + decodedData
                        print("Total Characters: \(self.houses.count)")

                        self.isLoading = false
                    }
                    
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = "😡 ERROR: Problem fetching data: \(error.localizedDescription)"
                    print("😡 ERROR: Problem fetching data: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func loadAll() {        
        Task {
            self.houses = try await networkService.loadAllHouses()
        }
        doneLoading = true
    }
}
