//
//  ApiRequest.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 27/06/23.
//

import Foundation

struct ApiRequest {
    var characterId: Int = 1
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
    
}

protocol ApiUrlRequest {
    func characterRequest(id: Int) async throws -> CharacterEntity
}

enum ApiError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
