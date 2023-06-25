//
//  ContentView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct DetailScreen: View {
    var viewModel: DetailScreenViewModel
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Text(viewModel.cardData.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                CharacterImageView(model: viewModel.cardData.picture)
                HStack{
                    Text("\(viewModel.cardData.species) - \(viewModel.cardData.gender)")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Text(viewModel.cardData.type)
                    .font(.title3)
                    .foregroundColor(.white)
                Text("Status: \(viewModel.cardData.status)")
                    .font(.title3)
                    .foregroundColor(.white)
                HStack(alignment: .top) {
                    CardView(model: viewModel.cardData.cards[0])
                    CardView(model: viewModel.cardData.cards[1])
                }
                HStack(alignment: .top) {
                    CardView(model: viewModel.cardData.cards[2])
                    CardView(model: viewModel.cardData.cards[3])
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(viewModel: .testModel)
    }
}
