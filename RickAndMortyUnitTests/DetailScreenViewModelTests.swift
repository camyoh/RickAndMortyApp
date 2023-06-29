//
//  DetailScreenViewModelTests.swift
//  RickAndMortyUnitTests
//
//  Created by Andres Mendieta on 28/06/23.
//

@testable import Rick_And_Morty
import XCTest

final class DetailScreenViewModelTests: XCTestCase {

    var fetchData: ApiRequestMock!
    var sut: DetailScreenViewModel!
    
    override func setUp() {
        super.setUp()
        fetchData = ApiRequestMock()
        sut = DetailScreenViewModel(data: .testModel, fetchData: fetchData)
        
    }

    override func tearDown() {
        fetchData = nil
        sut = nil
        super.tearDown()
    }
    
    func test_fetchDetailScreenData() async throws {
        // Given
        let expectedName = "Rick Sanchez"
        
        // When
        try await sut.fetchDetailScreenData()
        try await Task.sleep(nanoseconds: 100_000_000)
        
        // Then
        XCTAssertEqual(sut.data.name, expectedName)
    }
    
    func test_getWikiUrlFor() {
        // Given
        let name = "Rick Sanchez"
        let expectedUrlString = "https://rickandmorty.fandom.com/en/wiki/Rick_Sanchez"
        
        // When
        let url = sut.getWikiUrlFor(name: name)
        
        // Then
        XCTAssertEqual(url?.absoluteString, expectedUrlString)
    }

}
