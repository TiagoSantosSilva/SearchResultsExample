//
//  ListSearchResultsCollectionViewController.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class ListSearchResultsCollectionView: UICollectionView {

    // MARK: - Initialization

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .systemIndigo
    }

    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }
}
