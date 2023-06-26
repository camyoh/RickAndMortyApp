//
//  CardModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import Foundation
import SwiftUI

struct CardModel {
    let type: TypeOfCard
    let title: String
    let body: String
    let image: CardImage
    let additionalInfo: AdditionalInfoModel
    
    
    enum CardImage: String {
        case origin = "marte"
        case episode = "television"
        case location = "mapa"
        case moreInfo = "www"
    }
}

enum TypeOfCard {
    case place, episode, moreInfo
}

#if TESTING
extension CardModel {
    public static let testModel: CardModel = {
       CardModel(
        type: .place,
        title: "Title",
        body: "Body Body Body Body Body Body Body Body Body",
        image: .location,
        additionalInfo: .testModel
       )
    }()
    public static let testModel2: CardModel = {
       CardModel(
        type: .episode,
        title: "Title",
        body: "",
        image: .episode,
        additionalInfo: .testModel2
       )
    }()
}
#endif
