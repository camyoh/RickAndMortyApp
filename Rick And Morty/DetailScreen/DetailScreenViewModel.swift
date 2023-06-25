//
//  DetailCardViewModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

struct DetailScreenViewModel {
    let cardData: DetailScreenModel
}

#if TESTING
extension DetailScreenViewModel {
    public static var testModel: DetailScreenViewModel = {
        DetailScreenViewModel(cardData: .testModel)
    }()
}
#endif
