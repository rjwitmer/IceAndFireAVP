//
//  BooksVM.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-06.
//

import Foundation

@Observable
class BooksVM {
    var books: [Book] = []
    var doneLoading: Bool = false
    var errorMessage: String?
    
    var networkService: NetworkService = NetworkService()
    var isLoading: Bool = false
    
    func getData() {
        guard !doneLoading else { return }
        self.isLoading = true
        
        Task {
            do {
                let decodedData = try await networkService.fetchBookData()
                DispatchQueue.main.async {
                    if decodedData.count == 0 {
                        self.doneLoading = true
                        print("😡 ERROR: No API data")
                    } else {
                        print("👻 Got data")
                        
                        self.books = decodedData
                        print("Total Books: \(self.books.count)")

                        self.isLoading = false
//                        print("\(self.books.last?.name ?? "No Name")")
                        self.doneLoading = true
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
    
}
