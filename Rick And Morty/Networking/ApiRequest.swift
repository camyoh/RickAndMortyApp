//
//  ApiRequest.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 27/06/23.
//

import Foundation

struct ApiRequest {
    private func encodeSpaceInText(_ text: String) -> String {
        let textWithOnlyOneSpace = text.trimmingCharacters(in: .whitespaces)
        return textWithOnlyOneSpace.replacingOccurrences(of: " ", with: "%20")
    }
}

extension ApiRequest: ApiUrlRequest {
    
    func characterRequest(id: Int) async throws -> CharacterEntity {
        let endpoint = "https://rickandmortyapi.com/api/character/\(id)"
        
        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(CharacterEntity.self, from: data)
        } catch {
            throw ApiError.invalidData
        }
    }
    
    func searchCharacterBy(name: String) async throws -> CharacterSearchedEntity {
        let endpoint = "https://rickandmortyapi.com/api/character/?name=\(encodeSpaceInText(name))"
        
        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(CharacterSearchedEntity.self, from: data)
        } catch {
            throw ApiError.invalidData
        }
    }
}

public protocol ApiUrlRequest {
    func characterRequest(id: Int) async throws -> CharacterEntity
    func searchCharacterBy(name: String) async throws -> CharacterSearchedEntity
}

enum ApiError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
