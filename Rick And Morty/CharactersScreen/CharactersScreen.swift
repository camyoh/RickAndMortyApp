//
//  CharactersScreen.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import SwiftUI

struct CharactersScreen: View {
    @StateObject var viewModel: CharactersViewModel = .init()
    @State private var searchText = ""
    @State private var showDetailScreen = false
    @State private var showDetailScreen2 = false
    @State var saveCard = false
    
    init() {
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
                            viewModel: DetailScreenViewModel(data: DetailScreenModel(id: viewModel.selectedCharacter.characterID)),
                            showAddButton: false,
                            saveCard: $saveCard
                        )
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .scrollIndicators(.hidden)
            .padding(.horizontal, 20)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .background(Color(red: 13/255, green: 64/255, blue: 60/255))
            .navigationTitle(
                Text(viewModel.data.title)
            )
        }
        .navigationBarBackButtonHidden(true)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Search a character")) {
            ForEach(viewModel.searchedList) { character in
                Button {
                    viewModel.updateSelectedCharacter(with: character)
                    showDetailScreen2.toggle()
                } label: {
                    Text("\(character.name) - \(character.characterID)")
                }
            }
        }
        .sheet(isPresented: $showDetailScreen2) {
            DetailScreen(
                viewModel: DetailScreenViewModel(data: DetailScreenModel(id: viewModel.selectedCharacter.characterID)),
                showAddButton: true,
                saveCard: $saveCard)
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
        .onAppear() {
            print("vista lista")
        }
        .onChange(of: saveCard) { newValue in
            viewModel.addCharacterToList()
        }
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen()
    }
}
