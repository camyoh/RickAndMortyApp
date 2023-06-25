//
//  CardView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct CardView: View {
    private let model: CardModel
    
    init(model: CardModel) {
        self.model = model
    }
    
    var body: some View {
        Button {
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
                CardView(model: CardModel.testModel)
                CardView(model: CardModel.testModel2)
            }
            HStack {
                CardView(model: CardModel.testModel)
                CardView(model: CardModel.testModel)
            }
        }
        .padding()
        .background(.green)
    }
}
#endif
