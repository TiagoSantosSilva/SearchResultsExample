//
//  ListCell.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class ListCell: UICollectionViewCell {

    // MARK: - Properties

    private let nameLabel: UILabel = .init()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }

    // MARK: - Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }


    // MARK: - Configuration

    func configure(with viewModel: PokemonListCellViewModel) {
        nameLabel.text = viewModel.name
    }

    // MARK: - Setups

    private func setup() {
        contentView.addSubview(nameLabel)
        setupStyle()
        setupNameLabel()
    }

    private func setupStyle() {
        contentView.backgroundColor = .systemGray5
        round()
    }

    private func setupNameLabel() {
        // Constraints
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.NameLabel.side).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constraints.NameLabel.side).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.NameLabel.bottom).isActive = true

        // Style

        nameLabel.textColor = UIColor.label
        nameLabel.textAlignment = .center
        nameLabel.font = .nameLabel
    }
}

// MARK: - Constants

private extension ListCell {
    enum Constraints {
        enum NameLabel {
            static let side: CGFloat = 8
            static let bottom: CGFloat = 8
        }
    }
}
