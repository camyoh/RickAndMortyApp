//
//  DetailCardModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import Foundation

struct DetailScreenModel {
    let id: Int
    let name: String
    let picture: CharacterImageModel
    let species: String
    let gender: String
    let type: String
    let status: String
    let cards: [CardModel]
    
    init(
        id: Int = 1,
        name: String = "",
        picture: CharacterImageModel = CharacterImageModel(),
        species: String = "",
        gender: String = "",
        type: String = "",
        status: String = "",
        cards: [CardModel] = []
    ) {
        self.id = id
        self.name = name
        self.picture = picture
        self.species = species
        self.gender = gender
        self.type = type
        self.status = status
        self.cards = cards
    }
}

#if TESTING
extension DetailScreenModel {
    public static let testModel: DetailScreenModel = {
       DetailScreenModel(
        name: "Rick Sanchez",
        picture: .testModel,
        species: "Human",
        gender: "Male",
        type: "Genetic experiment",
        status: "unknown",
        cards: [
            CardModel(type: .place, title: "Origin", body: "Earth (Replacement Dimension)", image: .origin),//, additionalInfo: .testModel),
            CardModel(type: .place, title: "Location", body: "Citadel of Ricks", image: .location),//, additionalInfo: .testModel),
            CardModel(type: .episode, title: "Episodes", body: "", image: .episode),//, additionalInfo: .testModel2),
            CardModel(type: .moreInfo, title: "More Info", body: "", image: .moreInfo)//, additionalInfo: AdditionalInfoModel(typeOrCard: .moreInfo)),
        ]
       )
        
    }()
}
#endif
