//
//  TabBarController.swift
//  SearchResultsExample
//
//  Created by Tiago on 05/05/2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }
    
    // MARK: - Functions
    
    func setup(with viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        let tabBarItems: [UITabBarItem] = [.init(title: "Menu", image: UIImage.actions, tag: 0),
                                           .init(title: "My Bets", image: UIImage.add, tag: 1),
                                           .init(title: "Blackjack", image: UIImage.checkmark, tag: 2),
                                           .init(title: "Roulette", image: UIImage.remove, tag: 3),
                                           .init(title: "Gaming", image: UIImage.strokedCheckmark, tag: 4)]
        
        tabBarItems.enumerated().forEach { self.viewControllers?[$0.offset].tabBarItem = $0.element }
    }

    private func setupStyle() {
        tabBar.tintColor = .systemBlue
        tabBar.barTintColor = .systemGray5
        tabBar.unselectedItemTintColor = .secondaryLabel
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemGray5
    }
}
