//
//  PokemonListCellViewModel.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import Foundation

final class PokemonListCellViewModel {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let name: String

    // MARK: - Initialization

    init(name: String) {
        self.name = name
    }
}

// MARK: - Hashable

extension PokemonListCellViewModel: Hashable {
    static func == (lhs: PokemonListCellViewModel, rhs: PokemonListCellViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
