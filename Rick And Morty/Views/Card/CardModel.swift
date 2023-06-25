//
//  CardModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import Foundation
import SwiftUI

struct CardModel {
    private let title: String
    private let body: String
    private let image: Image
}

#if TESTING
extension CardModel {
    public static let testModel: CardModel = {
       CardModel(
        title: "Title",
        body: "Body",
        image: Image(systemName: "tv"))
    }()
}
#endif
