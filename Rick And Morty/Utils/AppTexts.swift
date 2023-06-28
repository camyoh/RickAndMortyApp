//
//  AppTexts.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 28/06/23.
//

import SwiftUI

extension Text {
    func styledTitleCard() -> some View {
        self
            .font(.subheadline)
            .fontWeight(.bold)
            .textCase(.uppercase)
            .foregroundColor(.white)
    }
    
    func styledBodyCard() -> some View {
        self
            .font(.body)
            .lineLimit(2)
            .minimumScaleFactor(0.5)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
    }
    
    func styledTitleCharacterCard() -> some View {
        self
            .foregroundColor(.white)
            .textCase(.uppercase)
            .multilineTextAlignment(.leading)
            .font(.headline)
    }
    
    func styledBodyCharacterCard() -> some View {
        self
            .foregroundColor(.white)
            .font(.body)
    }
}
