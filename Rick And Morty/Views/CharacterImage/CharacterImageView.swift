//
//  CharacterImage.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct CharacterImageView: View {
    private let model: CharacterImageModel
    
    init(
        model: CharacterImageModel
    ) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(.clear)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.width
                    )
                
                RoundedRectangle(cornerRadius: 12)
                    .frame(
                        width: geometry.size.width/2 * sqrt(2),
                        height: geometry.size.width/2 * sqrt(2)
                    )
                    .rotationEffect(Angle(degrees: 8))
                    .foregroundColor(model.backgroundColor)
                    .shadow(radius: 5)
                
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
                    width: geometry.size.width/2 * sqrt(2),
                    height: geometry.size.width/2 * sqrt(2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .rotationEffect(Angle(degrees: -2))
                .shadow(radius: 5)
            }
        }
    }
}

#if TESTING
struct CharacterImage_Previews: PreviewProvider {
    static var previews: some View {
        CharacterImageView(model: CharacterImageModel.testModel)
    }
}
#endif
