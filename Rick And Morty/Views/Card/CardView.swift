//
//  CardView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct CardView: View {
    private let model: CardModel
    private let scheme: CardViewScheme = .init()
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
        } label: {
            VStack(alignment: .leading, spacing: .none) {
                Text(model.title)
                    .styledTitleCard()
                    .padding()
                if !model.body.isEmpty {
                    Text(model.body)
                        .styledBodyCard()
                        .padding(.horizontal, scheme.bodyHorizontalPadding)
                }
                Image(model.image.rawValue)
                    .resizable()
                    .frame(width: scheme.imageWidth, height: scheme.imageWidth)
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.gray.opacity(scheme.opacity))
            .clipShape(RoundedRectangle(cornerRadius: scheme.cardRadius))
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
