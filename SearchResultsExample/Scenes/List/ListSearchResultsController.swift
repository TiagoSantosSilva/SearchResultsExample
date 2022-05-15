//
//  ListSearchResultsController.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class ListSearchResultsController: UICollectionViewController {

    // MARK: - Subviews

    private let textLabel: UILabel = .init()
    
    // MARK: - Initialization

    init() {
        let layout = UICollectionViewCompositionalLayout(section: ListCollectionViewLayout.layoutSection)
        let collectionView = ListSearchResultsCollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(collectionViewLayout: layout)
        self.collectionView = collectionView
        setupController()
    }

    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }

    // MARK: - Setups

    private func setupController() {
        edgesForExtendedLayout = []
        extendedLayoutIncludesOpaqueBars = false

        view.addSubview(textLabel)

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        textLabel.text = "SEARCH RESULTS CONTROLLER"
        textLabel.font = .textLabel
    }
}
