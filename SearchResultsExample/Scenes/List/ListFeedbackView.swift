//
//  ListFeedbackView.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class ListFeedbackView: UIView {

    // MARK: - Subviews

    private let textLabel: UILabel = .init()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Setups

    private func setupView() {
        backgroundColor = .systemOrange
        addSubview(textLabel)

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textLabel.text = "FEEDBACK VIEW"
        textLabel.font = .textLabel
    }
}
