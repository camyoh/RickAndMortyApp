//
//  CharacterImageModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import Foundation
import SwiftUI

struct CharacterImageModel {
    let imageUrl: URL?
    let backgroundColor: Color
    
    init(
        imageUrl: URL? = nil,
        backgroundColor: Color
    ) {
        self.imageUrl = imageUrl
        self.backgroundColor = backgroundColor
    }
}

#if TESTING
extension CharacterImageModel {
    static let testModel: CharacterImageModel = {
        CharacterImageModel(
            imageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/18.jpeg"),
            backgroundColor: .blue)
    }()
}
#endif
