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
            VStack(spacing: 0) {
                Text(model.title)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.top, 10)
                Spacer()
                Text(model.body)
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.black)
                Image(model.image.rawValue)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }

    }
}

#if TESTING
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                CardView(model: CardModel.testModel)
                CardView(model: CardModel.testModel)
            }
            HStack {
                CardView(model: CardModel.testModel)
                CardView(model: CardModel.testModel)
            }
        }
    }
}
#endif
