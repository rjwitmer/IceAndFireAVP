//
//  NetworkService.swift
//  IceAndFireAVP
//
//  Created by Bob Witmer on 2025-11-06.
//

import Foundation
import Network

@Observable
class NetworkService {
    private let monitor: NWPathMonitor = NWPathMonitor()
    private let queue: DispatchQueue = DispatchQueue(label: "NetworkMonitor")
    private var isConnected: Bool = true
    var pageBook: Int = 1 // Book List page number
    var pageHouse: Int = 1 // House List page number
    var pageCharacter: Int = 1 // Character List page number
    var houseIsDoneLoading: Bool = false
    var characterIsDoneLoading: Bool = false
    let pageSize: Int = 50 // Maximum API page size
    private let bookListURL: String = "https://anapioficeandfire.com/api/books"
    private let houseListURL: String = "https://anapioficeandfire.com/api/houses"
    private let characterListURL: String = "https://anapioficeandfire.com/api/characters"
    
    
    init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
    
    func fetchBookData() async throws -> [Book] {
        guard isConnected else {
            throw NetworkError.noInternetConnection
        }
        let url = URL(string: bookListURL + "?page=\(pageBook)&pageSize=\(pageSize)")!
        print("URL: \(url)")
        
        
        let (data, response) = try await URLSession.shared.data(from: url )
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("😡 ERROR: \(NetworkError.apiError)")
            throw NetworkError.apiError
        }
        print("HTTP Status: \(httpResponse.statusCode)")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let books = try decoder.decode([Book].self, from: data)
        return books
    }
    
    func fetchCharacterData() async throws -> [IandFCharacter] {
        guard isConnected else {
            throw NetworkError.noInternetConnection
        }
        let url = URL(string: characterListURL + "?page=\(pageCharacter)&pageSize=\(pageSize)")!
        print("URL: \(url)")
        
        
        let (data, response) = try await URLSession.shared.data(from: url )
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("😡 ERROR: \(NetworkError.apiError)")
            throw NetworkError.apiError
        }
        print("HTTP Status: \(httpResponse.statusCode)")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let characters = try decoder.decode([IandFCharacter].self, from: data)
        if characters.isEmpty {
            characterIsDoneLoading = true
            return []
        } else {
            pageCharacter += 1
            return characters
        }
    }
    
    func fetchHouseData() async throws -> [House] {
        guard isConnected else {
            throw NetworkError.noInternetConnection
        }
        let url = URL(string: houseListURL + "?page=\(pageHouse)&pageSize=\(pageSize)")!
        print("URL: \(url)")
        
        
        let (data, response) = try await URLSession.shared.data(from: url )
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("😡 ERROR: \(NetworkError.apiError)")
            throw NetworkError.apiError
        }
        print("HTTP Status: \(httpResponse.statusCode)")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let houses = try decoder.decode([House].self, from: data)
        if houses.isEmpty {
            houseIsDoneLoading = true
            return []
        } else {
            pageHouse += 1
            return houses
        }

    }
    
    func loadAllCharacters() async throws -> [IandFCharacter] {
        
        var allCharacters: [IandFCharacter] = []
        while !characterIsDoneLoading {
            let moreCharacters = try await self.fetchCharacterData()
            allCharacters.append(contentsOf: moreCharacters)
        }
        return allCharacters
    }
    
    func loadAllHouses() async throws -> [House] {
        var allHouses: [House] = []
        while !houseIsDoneLoading {
            let moreHouses = try await self.fetchHouseData()
            allHouses.append(contentsOf: moreHouses)
        }
        return allHouses
    }
    
    enum NetworkError: Error, LocalizedError {
        case noInternetConnection
        case apiError
        
        var errorDescription: String? {
            switch self {
            case .noInternetConnection:
                return "No internet connection. Please check your network settings."
            case .apiError:
                return "An error occurred while fetching data from the REST API. Please try again later."
            }
        }
    }
}
