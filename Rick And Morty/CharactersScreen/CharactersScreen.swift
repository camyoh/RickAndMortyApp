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
    
    var body: some View {
        NavigationView {
            List {
                Text("Hello there!")
                Text("Hello there!")
                Text("Hello there!")
            }
            .navigationTitle(viewModel.data.title)
            .toolbar {
                Button {
                    print("edit")
                } label: {
                    Image(systemName: "pencil")
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen(viewModel: .testModel)
    }
}
