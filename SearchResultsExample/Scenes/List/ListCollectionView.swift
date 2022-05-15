//
//  ListCollectionView.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class ListCollectionView: UICollectionView {

    // MARK: - Initialization

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .systemGray6
    }

    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }
}
