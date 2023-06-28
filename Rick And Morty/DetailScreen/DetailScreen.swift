//
//  ContentView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct DetailScreen: View {
    @StateObject var viewModel: DetailScreenViewModel = .init()
    @State private var showMoreInfo = false
    @State private var selectedCard: CardModel?
    @State private var typeOfCard: TypeOfCard?
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        if !viewModel.isLoading {
                            Text(viewModel.data.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            CharacterImageView(model: viewModel.data.picture)
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
                            if viewModel.data.cards.count == 4 {
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
                        } else {
                            ProgressView()
                        }
                        //            .sheet(isPresented: $showMoreInfo) {
                        //                if let additionalInfo = selectedCard?.additionalInfo {
                        //                    if additionalInfo.typeOrCard != .moreInfo {
                        //                        AdditionalInfoView(model: additionalInfo)
                        //                            .presentationDetents([.fraction(0.3)])
                        //                            .presentationDragIndicator(.hidden)
                        //                    }
                        //                }
                        //            }
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .top
                    )
                    .padding()
                    .background(
                        LinearGradient(
                            gradient:
                                Gradient(colors: [
                                    Color(red: 95/255, green: 198/255, blue: 58/255),
                                    Color(red: 60/255, green: 135/255, blue: 60/255),
                                    Color(red: 13/255, green: 64/255, blue: 60/255),
                                    Color(red: 60/255, green: 135/255, blue: 60/255),
                                    Color(red: 95/255, green: 198/255, blue: 58/255),
                                ]),
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing)
                    )
                    
                    NavigationLink {
                        //CharactersScreen()
                    } label: {
                        HStack(alignment: .bottom) {
                            Spacer()
                            Image(systemName: "list.bullet")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(.gray)
                                .clipShape(Circle())
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(.trailing, 18)
                    }
                    
                }
                .onAppear() {
                    print("Vista detalle \(viewModel.data.id)")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(viewModel: .testModel)
    }
}
