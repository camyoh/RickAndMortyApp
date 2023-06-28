//
//  ApiRequestMock.swift
//  RickAndMortyUnitTests
//
//  Created by Andres Mendieta on 28/06/23.
//

import Foundation
import Rick_And_Morty

class ApiRequestMock: ApiUrlRequest {
    func characterRequest(id: Int) async throws -> CharacterEntity {
        let jsonData = Data(RickAndMortyJSONs.character.utf8)
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(CharacterEntity.self, from: jsonData)
        } catch  {
            throw error
        }
    }
    
    func searchCharacterBy(name: String) async throws -> CharacterSearchedEntity {
        let jsonData = Data(RickAndMortyJSONs.searchByName.utf8)
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(CharacterSearchedEntity.self, from: jsonData)
        } catch  {
            throw error
        }
    }
    
    
}
