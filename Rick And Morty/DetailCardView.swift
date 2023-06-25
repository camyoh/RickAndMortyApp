//
//  ContentView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct DetailCardView: View {
    let model: DetailCardModel
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Text(model.name)
                    .font(.largeTitle)
                CharacterImageView(model: model.picture)
                HStack{
                    Text(model.species)
                        .font(.title2)
                    Text("-")
                        .font(.title2)
                    Text(model.gender)
                        .font(.title2)
                }
                Text(model.type)
                    .font(.title3)
                Text("Status: \(model.status)")
                    .font(.title3)
                HStack {
                    CardView(model: model.cards[0])
                    CardView(model: model.cards[2])
                }
                HStack {
                    CardView(model: model.cards[1])
                    CardView(model: model.cards[3])
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardView(model: .testModel)
    }
}
