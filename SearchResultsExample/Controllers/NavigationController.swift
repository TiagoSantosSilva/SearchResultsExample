//
//  NavigationController.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class NavigationController: UINavigationController {

    // MARK: - Initialization

    override init(rootViewController: UIViewController) {
        super.init(navigationBarClass: NavigationBar.self, toolbarClass: nil)
        self.setViewControllers([rootViewController], animated: false)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }
}
