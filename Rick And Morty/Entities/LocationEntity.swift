//
//  LocationEntity.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 27/06/23.
//

import Foundation

public struct LocationEntity: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
