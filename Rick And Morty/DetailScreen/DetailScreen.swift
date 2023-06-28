//
//  ContentView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct DetailScreen: View {
    @StateObject var viewModel: DetailScreenViewModel = .init(fetchData: ApiRequest())
    private let scheme: DetailScreenScheme = .init()
    @State private var showMoreInfo = false
    @State private var selectedCard: CardModel?
    @State private var typeOfCard: TypeOfCard?
    
    var showAddButton: Bool
    
    @Binding var saveCard: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            characterName
                            characterImage
                            characterInfo
                            
                            if viewModel.shouldShowCards {
                                infoCards
                            }
                        }
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .top
                    )
                    .padding()
                    .setGreenGradientBackground()
                    
                    floatingButton
                }
                .task {
                    do {
                        try await viewModel.fetchDetailScreenData()
                    } catch {
                        
                    }
                }
            }
        }
    }

    // MARK: Views
    var characterName: some View {
        Text(viewModel.data.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
    
    var characterImage: some View {
        CharacterImageView(model: viewModel.data.picture)
    }
    
    var characterInfo: some View {
        VStack() {
            HStack{
                Text("\(viewModel.data.species) - \(viewModel.data.gender)")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            Text(viewModel.data.type)
                .font(.title3)
                .foregroundColor(.white)
            Text("Status: \(viewModel.data.status)")
                .font(.title3)
                .foregroundColor(.white)
        }
    }
    
    var infoCards: some View {
        VStack() {
            HStack(alignment: .top) {
                CardView(model: viewModel.data.cards[0]) { card in
                    showMoreInfo = true
                    selectedCard = card
                }
                CardView(model: viewModel.data.cards[1]) { card in
                    showMoreInfo = true
                    selectedCard = card
                }
            }
            HStack(alignment: .top) {
                CardView(model: viewModel.data.cards[2]) { card in
                    showMoreInfo = true
                    selectedCard = card
                }
                CardView(model: viewModel.data.cards[3]) { card in
                    
                }
            }
        }
    }
    
    var floatingButton: some View {
        HStack(alignment: .bottom) {
            Spacer()
            Button {
                if showAddButton {saveCard.toggle()}
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: showAddButton ? scheme.addButton : scheme.listButton)
                    .font(.title2)
                    .frame(width: scheme.buttonWidth, height: scheme.buttonWidth)
                    .background(Color.gray)
                    .clipShape(Circle())
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.trailing, scheme.buttonPadding)
        .padding(.bottom, scheme.buttonPadding)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(viewModel: .testModel, showAddButton: false, saveCard: .constant(false))
    }
}
