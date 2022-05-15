//
//  ListViewModel.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import Foundation

enum ListResult {
    case success(group: PokemonListGroupViewModel)
    case error
}

protocol ListViewModelProtocol: AnyObject {
    var maximumTextLength: Int { get }

    func loadPokemon(completion: @escaping (ListResult) -> Void)
}

final class ListViewModel: ListViewModelProtocol {

    // MARK: - Properties

    var maximumTextLength: Int { Constants.maximumTextLength }

    private let loader: ListLoaderProtocol

    // MARK: - Initialization

    init(loader: ListLoaderProtocol) {
        self.loader = loader
    }

    // MARK: - Functions

    func loadPokemon(completion: @escaping (ListResult) -> Void) {
        Task {
            do {
                let pokemon = try await loader.loadPokemon()
                let cellViewModels = pokemon.map { PokemonListCellViewModel(name: $0.name) }
                completion(.success(group: PokemonListGroupViewModel(pokemon: cellViewModels)))
            } catch {
                completion(.error)
            }
        }
    }
}

// MARK: - Constants

extension ListViewModel {
    enum Constants {
        static let maximumTextLength: Int = 10
    }
}
