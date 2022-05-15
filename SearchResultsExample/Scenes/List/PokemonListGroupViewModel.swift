//
//  PokemonListGroupViewModel.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import Foundation

final class PokemonListGroupViewModel {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let pokemon: [PokemonListCellViewModel]

    // MARK: - Initialization

    init(pokemon: [PokemonListCellViewModel]) {
        self.pokemon = pokemon
    }
}

// MARK: - Hashable

extension PokemonListGroupViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    static func == (lhs: PokemonListGroupViewModel, rhs: PokemonListGroupViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
