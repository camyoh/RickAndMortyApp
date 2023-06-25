//
//  CharactersScreen.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import SwiftUI

struct CharactersScreen: View {
    let viewModel: CharactersViewModel
    @State private var searchText = ""
    
    init(
        viewModel: CharactersViewModel
    ) {
        UINavigationBar.appearance().tintColor = .white
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.data.cards) { card in
                    CharacterCardView(model: card)
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 20)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .background(Color(red: 13/255, green: 64/255, blue: 60/255))
            .navigationTitle(
                Text(viewModel.data.title)
                    .foregroundColor(.white)
            )
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Search a character").foregroundColor(.white))
        .environment(\.colorScheme, .dark)
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen(viewModel: .testModel)
    }
}
