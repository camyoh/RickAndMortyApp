//
//  DetailCardViewModel.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import Foundation

class DetailScreenViewModel: ObservableObject {
    @Published var data: DetailScreenModel
    @Published var isLoading: Bool
    let fetchData: ApiRequest
    
    init(
        data: DetailScreenModel = DetailScreenModel(),
        fetchData: ApiRequest = ApiRequest()
    ) {
        self.data = data
        self.fetchData = fetchData
        self.isLoading = true
    }
    
    func fetchDetailScreenData() async throws {
        do {
            let detailScreenModel = try await getDetailScreenModel(from: fetchData.characterRequest(id: data.id))
            DispatchQueue.main.async {
                self.data = detailScreenModel
                self.isLoading = false
            }
            
        } catch {
            
        }
    }
    
    private func getDetailScreenModel(from character: CharacterEntity) -> DetailScreenModel {
        DetailScreenModel(
            name: character.name,
            picture: CharacterImageModel(imageUrl: URL(string: character.image)),
            species: character.species,
            gender: character.gender,
            type: character.type,
            status: character.status,
            cards: [
                CardModel(type: .place, title: "Origin", body: character.origin.name, image: .origin),
                CardModel(type: .place, title: "Location", body: character.location.name, image: .location),
                CardModel(type: .episode, title: "Episodes", body: "", image: .episode),
                CardModel(type: .moreInfo, title: "More Info", body: "", image: .moreInfo),
            ])
    }
}

#if TESTING
extension DetailScreenViewModel {
    public static var testModel: DetailScreenViewModel = {
        DetailScreenViewModel(data: .testModel)
    }()
}
#endif
