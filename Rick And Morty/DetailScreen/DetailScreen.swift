//
//  ContentView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct DetailScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel: DetailScreenViewModel = .init()
    private let scheme: DetailScreenScheme = .init()
    
    var showAddButton: Bool
    @Binding var saveCard: Bool
    
    @Environment(\.dismiss) private var dismiss
    
//    init(
//        viewModel: DetailScreenViewModel = .init(),
//        showAddButton: Bool,
//        saveCard: Binding<Bool>
//    ) {
//        self._viewModel = StateObject(wrappedValue: viewModel)
//        self.showAddButton = showAddButton
//        self._saveCard = saveCard
//        UINavigationBar.appearance().tintColor = .white
//    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    //                    characterName
                    characterImage
                    characterInfo
                    
                    if viewModel.shouldShowCards {
                        infoCards
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .navigationTitle(Text(viewModel.data.name))
//        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .setGreenGradientBackground()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add") {
                    saveCard.toggle()
                    dismiss()
                }
            }
        }
        .task {
            do {
                try await viewModel.fetchDetailScreenData()
            } catch {
                
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
                }
                CardView(model: viewModel.data.cards[1]) { card in
                }
            }
            HStack(alignment: .top) {
                CardView(model: viewModel.data.cards[2]) { card in
                }
                CardView(model: viewModel.data.cards[3]) { card in
                    if let wikiURL = viewModel.getWikiUrlFor(name: viewModel.data.name) {
                        UIApplication.shared.open(wikiURL)
                    }
                }
            }
        }
    }
    
    var floatingButton: some View {
        HStack(alignment: .bottom) {
            Spacer()
            Button {
                coordinator.goCharacterList()
//                if showAddButton {saveCard.toggle()}
//                presentationMode.wrappedValue.dismiss()
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
    @State static var coordinator = Coordinator()
    static var previews: some View {
            DetailScreen(viewModel: .testModel, showAddButton: false, saveCard: .constant(false))
                .environmentObject(coordinator)
    }
}
