//
//  CharacterSearched.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 28/06/23.
//

import Foundation

public struct CharacterSearchedEntity: Codable {
    let info: InfoCharacterSearchedEntity
    let results: [CharacterEntity]
}

public struct InfoCharacterSearchedEntity: Codable {
    let count, pages: Int
    let next, prev: String?
}

