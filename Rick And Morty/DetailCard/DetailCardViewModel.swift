//
//  DetailCardViewModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

struct DetailCardViewModel {
    let cardData: DetailCardModel
}

#if TESTING
extension DetailCardViewModel {
    public static var testModel: DetailCardViewModel = {
        DetailCardViewModel(cardData: .testModel)
    }()
}
#endif
