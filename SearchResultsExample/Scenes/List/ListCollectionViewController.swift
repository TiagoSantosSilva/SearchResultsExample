//
//  ListCollectionViewController.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

protocol ListCollectionViewControllerDelegate: AnyObject {
    func collectionViewController(_ collectionViewController: ListCollectionViewController, didSelectItemAt indexPath: IndexPath)
}

final class ListCollectionViewController: UICollectionViewController {

    // MARK: - Typealiases

    private typealias CellRegistration = UICollectionView.CellRegistration<ListCell, PokemonListCellViewModel>
    private typealias DataSource = UICollectionViewDiffableDataSource<PokemonListGroupViewModel, PokemonListCellViewModel>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<PokemonListGroupViewModel, PokemonListCellViewModel>

    // MARK: - Properties

    weak var delegate: ListCollectionViewControllerDelegate?

    private let dataSource: DataSource

    // MARK: - Initialization

    init() {
        let layout = UICollectionViewCompositionalLayout(section: ListCollectionViewLayout.layoutSection)
        let collectionView = ListCollectionView(frame: .zero, collectionViewLayout: layout)
        self.dataSource = DataSource(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: layout)
        self.collectionView = collectionView
    }

    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }

    // MARK: - Functions

    @MainActor func update(with group: PokemonListGroupViewModel) {
        Task {
            var snapshot = Snapshot()
            snapshot.appendSections([group])
            snapshot.appendItems(group.pokemon, toSection: group)

            await dataSource.apply(snapshot, animatingDifferences: true)
        }
    }

    // MARK: - Cell Provider

    private static var cellProvider: ((UICollectionView, IndexPath, PokemonListCellViewModel) -> UICollectionViewCell?) {
        let cellRegistration = CellRegistration { cell, _, cellViewModel in
            cell.configure(with: cellViewModel)
        }

        return { collectionView, indexPath, cellViewModel in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                         for: indexPath,
                                                         item: cellViewModel)
        }
    }
}
