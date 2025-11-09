//
//  CharactersVM.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-07.
//

import Foundation

@Observable
class CharactersVM {
    var characters: [Character] = []
    var doneLoading: Bool = false
    var errorMessage: String?
    
    var networkService: NetworkService = NetworkService()
    var isLoading: Bool = false
    
    func getData() {
        guard !doneLoading else { return }
        self.isLoading = true
        
        Task {
            do {
                let decodedData = try await networkService.fetchCharacterData()
                DispatchQueue.main.async {
                    if decodedData.count == 0 {
                        self.doneLoading = true
                        print("😡 ERROR: No API data")
                    } else {
                        print("👻 Got data")
                        
                        self.characters = self.characters + decodedData
                        print("Total Characters: \(self.characters.count)")

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
            self.characters = try await networkService.loadAllCharacters()
        }
    }
    
}
