//
//  CharacterCardModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation
import SwiftUI

struct CharacterCardModel: Identifiable {
    let id: UUID
    let characterID: Int
    let name: String
    let species: String
    let gender: String
    let imageUrl: URL?
    
    init(
        id: UUID = .init(),
        characterID: Int = 1,
        name: String = "",
        species: String = "",
        gender: String = "",
        imageUrl: URL? = nil
    ) {
        self.id = id
        self.characterID = characterID
        self.name = name
        self.species = species
        self.gender = gender
        self.imageUrl = imageUrl
    }
}

#if TESTING
extension CharacterCardModel {
    public static var testModel: CharacterCardModel = {
        CharacterCardModel(
            name: "Rick Sanchez",
            species: "Human",
            gender: "Male",
            imageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        )
    }()
}
#endif
