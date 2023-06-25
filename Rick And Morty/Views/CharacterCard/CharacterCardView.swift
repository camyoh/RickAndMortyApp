//
//  CharacterCardView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import SwiftUI

struct CharacterCardView: View {
    let model: CharacterCardModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.name)
                    .foregroundColor(.white)
                    .textCase(.uppercase)
                    .font(.headline)
                    .padding()
                Text("\(model.species) - \(model.gender)")
                    .foregroundColor(.white)
                    .font(.body)
                    .padding()
            }
            Spacer()
            AsyncImage(url: model.imageUrl) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                case .empty:
                    EmptyView()
                case .success(let image):
                    image
                        .resizable()
                @unknown default:
                    ProgressView()
                }
            }
            .frame(
                width: 80,
                height: 80
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .shadow(radius: 5)
            .padding(10)
        }
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 18) {
            CharacterCardView(model: .testModel)
            CharacterCardView(model: .testModel)
            CharacterCardView(model: .testModel)
        }
        .background(.black)
    }
}
