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
            VStack(spacing: 10) {
                Text(model.title)
                    .font(.title)
                    .foregroundColor(.black)
                Text(model.body)
                    .font(.body)
                    .foregroundColor(.black)
                Image(model.image.rawValue)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .frame(width: 140, height: 140)
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
