//
//  RickAndMortyUnitTests.swift
//  RickAndMortyUnitTests
//
//  Created by Andres Mendieta on 28/06/23.
//

@testable import Rick_And_Morty
import XCTest

final class CharactersViewModelTests: XCTestCase {
    var fetchData: ApiRequestMock!
    var sut: CharactersViewModel!
    
    override func setUp() {
        super.setUp()
        fetchData = ApiRequestMock()
        sut = CharactersViewModel(data: .testModel, fetchData: fetchData)
        
    }

    override func tearDown() {
        fetchData = nil
        sut = nil
        super.tearDown()
    }

    func test_fetchCharacterBy_whenSearchAName_setsSearchedList() async throws {
        // Given
        let expectedSearchListCount = 4
        
        // When
        try await sut.fetchCharacterBy(name: "")
        try await Task.sleep(nanoseconds: 100_000_000)
        
        // Then
        XCTAssertEqual(sut.searchedList.count, expectedSearchListCount)
    }
    
    func test_clearSearchedList_whenANameWasSearched() async throws {
        // Given
        let expectedSearchListCount = 0
        
        // When
        try await sut.fetchCharacterBy(name: "")
        try await Task.sleep(nanoseconds: 100_000_000)
        sut.clearSearchedList()
        
        // Then
        XCTAssertEqual(sut.searchedList.count, expectedSearchListCount)
    }
    
    func test_updateSelectedCharacter() {
        // Given
        let character = CharacterCardModel(name: "Rick")
        let expectedName = "Rick"
        
        // When
        sut.updateSelectedCharacter(with: character)
        
        // Then
        XCTAssertEqual(sut.selectedCharacter.name, expectedName)
    }
    
    func test_addCharacterToList() {
        // Given
        let character = CharacterCardModel(name: "Rick")
        let expectedCountCards = sut.data.cards.count + 1
        
        // When
        sut.updateSelectedCharacter(with: character)
        sut.addCharacterToList()
        
        // Then
        XCTAssertEqual(sut.data.cards.count, expectedCountCards)
    }
    
    func test_getDetailCardViewModel() {
        // Given
        let character = CharacterCardModel(characterID: 12, name: "Rick")
        let expectedDetailScreenVM = DetailScreenViewModel(
            data: DetailScreenModel(id: character.characterID, name: character.name), fetchData: fetchData)
        
        // When
        sut.updateSelectedCharacter(with: character)
        let detailCardVM = sut.getDetailCardViewModel()
        
        // Then
        XCTAssertEqual(detailCardVM.data.id, expectedDetailScreenVM.data.id)
        XCTAssertEqual(detailCardVM.data.name, expectedDetailScreenVM.data.name)
        
    }

}
