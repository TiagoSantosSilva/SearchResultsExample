//
//  NavigationBar.swift
//  SearchResultsExample
//
//  Created by Tiago on 05/05/2022.
//

import UIKit

final class NavigationBar: UINavigationBar {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }

    // MARK: - Setups

    private func setup() {
        self.prefersLargeTitles = false

        let appearance = NavigationBarAppearance()
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance

        tintColor = .systemBlue
    }
}
