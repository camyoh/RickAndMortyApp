//
//  CharactersModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

struct CharactersModel {
    let title: String
    var cards: [CharacterCardModel]
    
    init(
        title: String = "Characters",
        cards: [CharacterCardModel] = []
    ) {
        self.title = title
        self.cards = cards
    }
}

#if TESTING
extension CharactersModel {
    public static var testModel: CharactersModel = {
       CharactersModel(
        title: "Characters",
        cards: [.testModel, .testModel, .testModel, .testModel, .testModel, .testModel, .testModel])
    }()
}
#endif
