//
//  CharactersScreen.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import SwiftUI

struct CharactersScreen: View {
    @StateObject var viewModel: CharactersViewModel
    @State private var searchText = ""
    @State private var showDetailScreen = false
    @State private var showDetailScreenWithAddIcon = false
    @State var shouldSaveCard = false
    
    init(
        viewModel: CharactersViewModel = .init(fetchData: ApiRequest())
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.data.cards) { card in
                    CharacterCardView(model: card) { card in
                        viewModel.updateSelectedCharacter(with: card)
                        showDetailScreen = true
                    }
                    .fullScreenCover(isPresented: $showDetailScreen) {
                        DetailScreen(
                            viewModel: viewModel.getDetailCardViewModel(),
                            showAddButton: false,
                            saveCard: $shouldSaveCard
                        )
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .scrollIndicators(.hidden)
            .padding(.horizontal, 20)
            .background(Color.rickDarkGreen)
            .navigationTitle(
                Text(viewModel.data.title)
            )
        }
        .navigationBarBackButtonHidden(true)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Search a character")) {
            ForEach(viewModel.searchedList) { character in
                Button {
                    viewModel.updateSelectedCharacter(with: character)
                    showDetailScreenWithAddIcon.toggle()
                } label: {
                    Text("\(character.name) - \(character.characterID)")
                }
            }
        }
        .sheet(isPresented: $showDetailScreenWithAddIcon) {
            DetailScreen(
                viewModel: viewModel.getDetailCardViewModel(),
                showAddButton: true,
                saveCard: $shouldSaveCard)
        }
        .onChange(of: searchText, perform: { newValue in
            Task {
                if (!newValue.isEmpty && newValue.count >= 3) {
                    do {
                        try await viewModel.fetchCharacterBy(name: newValue)
                    } catch  {
                        
                    }
                } else {
                    viewModel.clearSearchedList()
                }
                
            }
        })
        .environment(\.colorScheme, .dark)
        .onChange(of: shouldSaveCard) { newValue in
            viewModel.addCharacterToList()
        }
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen(viewModel: .testModel)
    }
}
