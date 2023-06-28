//
//  CharactersViewModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var data: CharactersModel
    @Published var searchedList: [CharacterCardModel]
    @Published var selectedCharacter: CharacterCardModel
    let fetchData: ApiRequest
    
    init(
        data: CharactersModel = .init(),
        fetchData: ApiRequest = .init()
    ) {
        self.data = data
        self.fetchData = fetchData
        self.searchedList = []
        self.selectedCharacter = .init()
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
    
    func updateSelectedCharacter(with character: CharacterCardModel) {
        selectedCharacter = character
    }
    
    func addCharacterToList() {
        data.cards.append(selectedCharacter)
    }
    
    private func getSearchedCharacterCardModel(from search: CharacterSearchedEntity) -> [CharacterCardModel] {
        search.results.map { character in
            CharacterCardModel(
                characterID: character.id,
                name: character.name,
                species: character.species,
                gender: character.gender,
                imageUrl: URL(string: character.image)
            )
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
