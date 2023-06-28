//
//  CharactersViewModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var data: CharactersModel
    @Published var searchedList: [SearchedCharacterCardModel]
    let fetchData: ApiRequest
    var searchedCharacterID = 1
    
    init(
        data: CharactersModel = .init(),
        fetchData: ApiRequest = .init()
    ) {
        self.data = data
        self.fetchData = fetchData
        self.searchedList = []
    }
    
    func clearSearchedList() {
        searchedList = []
    }
    
    func fetchCharacterBy(name: String) async throws {
        do {
            let searchedList = try await getSearchedCharacterCardModel(from: fetchData.searchCharacterBy(name: name))
            DispatchQueue.main.async {
                self.searchedList = searchedList
            }
        } catch  {
            
        }
    }
    
    func updateSearchedCharacterID(with id: Int) {
        searchedCharacterID = id
    }
    
    private func getSearchedCharacterCardModel(from search: CharacterSearchedEntity) -> [SearchedCharacterCardModel] {
        search.results.map { character in
            SearchedCharacterCardModel(name: character.name, id: character.id)
        }
    }
}

struct SearchedCharacterCardModel: Identifiable {
    let name: String
    let id: Int
    
    init(name: String = "", id: Int = 1) {
        self.name = name
        self.id = id
    }
}

#if TESTING
extension CharactersViewModel {
    public static var testModel: CharactersViewModel = {
        CharactersViewModel(data: .testModel)
    }()
}
#endif
