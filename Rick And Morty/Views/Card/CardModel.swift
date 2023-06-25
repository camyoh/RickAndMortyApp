//
//  CardModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import Foundation
import SwiftUI

struct CardModel {
    let title: String
    let body: String
    let image: CardImage
}

enum CardImage: String {
    case origin = "marte"
    case episode = "television"
    case location = "mapa"
    case moreInfo = "www"
}

#if TESTING
extension CardModel {
    public static let testModel: CardModel = {
       CardModel(
        title: "Title",
        body: "Body",
        image: .episode)
    }()
}
#endif
