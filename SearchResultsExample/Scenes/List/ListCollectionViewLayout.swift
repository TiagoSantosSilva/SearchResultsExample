//
//  ListCollectionViewLayout.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class ListCollectionViewLayout: UICollectionViewLayout {

    static var layoutSection: NSCollectionLayoutSection = {
        let itemSize = NSCollectionLayoutSize(widthDimension: Constants.Layout.Item.width,
                                              heightDimension: Constants.Layout.Item.height)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(withEqualValue: Constants.Layout.Item.contentInset)

        let groupSize = NSCollectionLayoutSize(widthDimension: Constants.Layout.Group.width,
                                               heightDimension: Constants.Layout.Group.height)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(withEqualValue: Constants.Layout.Section.contentInset)

        layoutSection.boundarySupplementaryItems = []
        return layoutSection
    }()
}

// MARK: - Constants

private extension ListCollectionViewLayout {
    enum Constants {
        enum Layout {
            enum Item {
                static let width: NSCollectionLayoutDimension = .fractionalWidth(1/3)
                static let height: NSCollectionLayoutDimension = .fractionalHeight(1.0)
                static let contentInset: CGFloat = 4
            }

            enum Group {
                static let width: NSCollectionLayoutDimension = .fractionalWidth(1.0)
                static let height: NSCollectionLayoutDimension = .fractionalHeight(1/6)
            }

            enum Section {
                static let contentInset: CGFloat = 8
            }
        }
    }
}
