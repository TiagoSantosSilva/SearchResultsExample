//
//  Pokemon.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import Foundation

struct PokemonResult: Decodable {
    let pokemon: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case pokemon = "results"
    }
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}
