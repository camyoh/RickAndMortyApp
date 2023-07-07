//
//  File.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 1/07/23.
//

import SwiftUI

@MainActor
class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var page: ScreenType = .characterList
    @Published var currentCharacter: CharacterEntity?
    
    private var characterID: Int = 1
    
    @Environment(\.dismiss) private var dismiss
    
    func goCharacterDetail(for id: Int) {
        characterID = id
        path.append(ScreenType.detailCharacter)
    }
    
    func goCharacterList() {
        path.removeLast(path.count)
    }
    
    func goBackAndSave() {
        dismiss()
    }
    
    // MARK: View Providers
    @ViewBuilder
    func getPage(_ page: ScreenType) -> some View {
        switch page {
        case .characterList:
            CharactersScreen()
        case .detailCharacter:
            
        }
    }
}

enum ScreenType: String, CaseIterable, Identifiable {
    case detailCharacter
    case characterList
    
    var id: String {self.rawValue}
}
