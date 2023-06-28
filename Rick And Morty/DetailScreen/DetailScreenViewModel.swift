//
//  DetailCardViewModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

struct DetailScreenViewModel {
    let data: DetailScreenModel
    
    init(
        data: DetailScreenModel = DetailScreenModel()
    ) {
        self.data = data
    }
}

#if TESTING
extension DetailScreenViewModel {
    public static var testModel: DetailScreenViewModel = {
        DetailScreenViewModel(data: .testModel)
    }()
}
#endif
