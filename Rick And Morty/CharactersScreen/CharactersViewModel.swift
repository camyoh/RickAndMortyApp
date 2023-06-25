//
//  CharactersViewModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

struct CharactersViewModel {
    let data: CharactersModel
}

#if TESTING
extension CharactersViewModel {
    public static var testModel: CharactersViewModel = {
        CharactersViewModel(data: .testModel)
    }()
}
#endif
