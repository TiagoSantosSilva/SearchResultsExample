//
//  NavigationBarAppearance.swift
//  SearchResultsExample
//
//  Created by Tiago on 05/05/2022.
//

import UIKit

final class NavigationBarAppearance: UINavigationBarAppearance {

    // MARK: - Initialization

    override init(barAppearance: UIBarAppearance) {
        super.init(barAppearance: barAppearance)
    }

    override init(idiom: UIUserInterfaceIdiom) {
        super.init(idiom: idiom)
        stylize()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }

    // MARK: - Setups

    private func stylize() {
        configureWithOpaqueBackground()
        titleTextAttributes = [.foregroundColor: UIColor.label]
        largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        shadowColor = .clear
        backgroundColor = UIColor.systemGray6
    }
}
