//
//  DetailCardModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import Foundation

struct DetailCardModel {
    let name: String
    let picture: CharacterImageModel
    let species: String
    let gender: String
    let type: String
    let status: String
    let cards: [CardModel]
}

#if TESTING
extension DetailCardModel {
    public static let testModel: DetailCardModel = {
       DetailCardModel(
        name: "Rick Sanchez",
        picture: .testModel,
        species: "Human",
        gender: "Male",
        type: "Genetic experiment",
        status: "unknown",
        cards: [
            CardModel(title: "Origin", body: "Earth (Replacement Dimension)", image: .origin),
            CardModel(title: "Location", body: "Citadel of Ricks", image: .location),
            CardModel(title: "Episodes", body: "", image: .episode),
            CardModel(title: "More Info", body: "", image: .moreInfo),
        ])
    }()
}
#endif
