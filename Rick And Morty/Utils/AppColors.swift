//
//  AppColors.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 28/06/23.
//

import SwiftUI

extension Color {
    public static let rickDarkGreen: Color = Color("RickDarkGreen")
    public static let rickGreen: Color = Color("RickGreen")
    public static let rickLightGreen: Color = Color("RickLightGreen")
    public static let rickYellow: Color = Color("RickYellow")
}

extension View {
    func setGreenGradientBackground() -> some View {
        self.background(
            LinearGradient(
                gradient:
                    Gradient(colors: [
                        Color.rickLightGreen,
                        Color.rickGreen,
                        Color.rickDarkGreen,
                        Color.rickGreen,
                        Color.rickLightGreen,
                    ]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing)
        )
    }
}
