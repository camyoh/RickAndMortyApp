//
//  DetailCardModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import Foundation

struct DetailScreenModel {
    let name: String
    let picture: CharacterImageModel
    let species: String
    let gender: String
    let type: String
    let status: String
    let cards: [CardModel]
    
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
            CardModel(type: .place, title: "Origin", body: "Earth (Replacement Dimension)", image: .origin, additionalInfo: .testModel),
            CardModel(type: .place, title: "Location", body: "Citadel of Ricks", image: .location, additionalInfo: .testModel),
            CardModel(type: .episode, title: "Episodes", body: "", image: .episode, additionalInfo: .testModel2),
            CardModel(type: .moreInfo, title: "More Info", body: "", image: .moreInfo, additionalInfo: AdditionalInfoModel(typeOrCard: .moreInfo)),
        ]
       )
        
    }()
}
#endif
