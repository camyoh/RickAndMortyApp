//
//  Rick_And_MortyApp.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 24/06/23.
//

import SwiftUI

@main
struct Rick_And_MortyApp: App {
    @StateObject private var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(coordinator)
                .environment(\.colorScheme, .dark)
        }
    }
}
