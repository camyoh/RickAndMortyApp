//
//  AdditionalInfoModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

struct AdditionalInfoModel {
    let typeOrCard: TypeOfCard
    let name: String
    let type: String
    let dimension: String
    let episodes: [String]
    
    init(
        typeOrCard: TypeOfCard = .place,
        name: String = "",
        type: String = "",
        dimension: String = "",
        episodes: [String] = []
    ) {
        self.typeOrCard = typeOrCard
        self.name = name
        self.type = type
        self.dimension = dimension
        self.episodes = episodes
    }
}

#if TESTING
extension AdditionalInfoModel {
    public static var testModel: AdditionalInfoModel = {
        AdditionalInfoModel(name: "Citadel of Ricks", type: "Space station", dimension: "unknown")
    }()
    public static var testModel2: AdditionalInfoModel = {
        AdditionalInfoModel(typeOrCard: .episode, episodes: ["Episode 4","Episode 6","Episode 7","Episode 8","Episode 9",])
    }()
}
#endif
