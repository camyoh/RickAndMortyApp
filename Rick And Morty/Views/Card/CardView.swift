//
//  CardView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct CardView: View {
    private let model: CardModel
    private let onCardSelected: (CardModel) -> Void
    
    init(
        model: CardModel,
        onCardSelected: @escaping (CardModel) -> Void
    ) {
        self.model = model
        self.onCardSelected = onCardSelected
    }
    
    var body: some View {
        Button {
            onCardSelected(model)
            print("Hello there!")
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                Text(model.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding()
                if !model.body.isEmpty {
                    Text(model.body)
                        .font(.body)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                }
                Image(model.image.rawValue)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#if TESTING
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack(alignment: .top) {
                CardView(model: CardModel.testModel) { _ in
                    
                }
                CardView(model: CardModel.testModel2) { _ in
                    
                }
            }
            HStack {
                CardView(model: CardModel.testModel) { _ in
                    
                }
                CardView(model: CardModel.testModel) { _ in
                    
                }
            }
        }
        .padding()
        .background(.green)
    }
}
#endif
