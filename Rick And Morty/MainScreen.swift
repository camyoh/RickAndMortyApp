//
//  MainScreen.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 2/07/23.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(ScreenType.characterList)
                .navigationDestination(for: ScreenType.self) { page in
                    coordinator.getPage(page)
                }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    @State static var coordinator = Coordinator()
    static var previews: some View {
        MainScreen()
            .environmentObject(coordinator)
    }
}
