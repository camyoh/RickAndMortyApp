//
//  CharacterImage.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

struct CharacterImageView: View {
    private let model: CharacterImageModel
    private let scheme: CharacterImageScheme = .init()
    
    init(
        model: CharacterImageModel
    ) {
        self.model = model
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: scheme.cornerRadius)
                .frame(
                    width: scheme.imageWidth,
                    height: scheme.imageWidth
                )
                .rotationEffect(Angle(degrees: scheme.rotationDegrees))
                .foregroundColor(model.backgroundColor)
                .shadow(radius: scheme.shadowRadius)
            
            AsyncImage(url: model.imageUrl) { phase in
                switch phase {
                case .failure:
                    Image(systemName: scheme.failureIcon)
                        .font(.largeTitle)
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                @unknown default:
                    ProgressView()
                }
            }
            .frame(
                width: scheme.imageWidth,
                height: scheme.imageWidth
            )
            .clipShape(RoundedRectangle(cornerRadius: scheme.cornerRadius))
            .rotationEffect(Angle(degrees: scheme.rotationImageDegrees))
            .shadow(radius: scheme.shadowRadius)
        }
        .frame(width: scheme.containerWidth, height: scheme.containerWidth)
    }
}

#if TESTING
struct CharacterImage_Previews: PreviewProvider {
    static var previews: some View {
        CharacterImageView(model: CharacterImageModel.testModel)
    }
}
#endif
