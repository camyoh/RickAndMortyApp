//
//  CharacterEntity.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 27/06/23.
//

import Foundation

public struct CharacterEntity: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}
