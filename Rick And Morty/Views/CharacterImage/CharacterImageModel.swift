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
        backgroundColor: Color = Color(red: 250/255, green: 248/255, blue: 191/255)
    ) {
        self.imageUrl = imageUrl
        self.backgroundColor = backgroundColor
    }
}

#if TESTING
extension CharacterImageModel {
    static let testModel: CharacterImageModel = {
        CharacterImageModel(
            imageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
            backgroundColor: Color(red: 250/255, green: 248/255, blue: 191/255))
    }()
}
#endif
