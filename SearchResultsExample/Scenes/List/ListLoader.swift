//
//  ListLoader.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import Foundation

protocol ListLoaderProtocol: AnyObject {
    func loadPokemon() async throws -> [Pokemon]
}

final class ListLoader: ListLoaderProtocol {

    // MARK: - Properties

    private let networkEngine: NetworkEngineProtocol

    // MARK: - Initialization

    init(networkEngine: NetworkEngineProtocol) {
        self.networkEngine = networkEngine
    }

    // MARK: - Functions

    func loadPokemon() async throws -> [Pokemon] {
        let result = try await networkEngine.request() as PokemonResult
        return result.pokemon
    }
}
