//
//  CharacterSearched.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 28/06/23.
//

import Foundation

// MARK: - CharacterSearched
struct CharacterSearchedEntity: Codable {
    let info: InfoCharacterSearchedEntity
    let results: [CharacterEntity]
}

// MARK: - InfoCharacterSearched
struct InfoCharacterSearchedEntity: Codable {
    let count, pages: Int
    let next, prev: String?
}

