//
//  AppDelegate.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    private lazy var tabBarController: UITabBarController = {
        let tabBarController = TabBarController()
        tabBarController.setup(with: [navigationController,
                                      UINavigationController(rootViewController: UIViewController()),
                                      UINavigationController(rootViewController: UIViewController()),
                                      UINavigationController(rootViewController: UIViewController()),
                                      UINavigationController(rootViewController: UIViewController())])
        return tabBarController
    }()

    private lazy var navigationController: NavigationController = NavigationController(rootViewController: viewController)
    private lazy var viewController: ListViewController = {
        let engine = NetworkEngine()
        let loader = ListLoader(networkEngine: engine)
        let viewModel = ListViewModel(loader: loader)
        let collectionViewController = ListCollectionViewController()
        let searchResultsController = ListSearchResultsController()
        let searchController = ListSearchController(searchResultsController: searchResultsController)
        return ListViewController(collectionViewController: collectionViewController,
                                  searchController: searchController,
                                  viewModel: viewModel)
    }()

    // MARK: UIApplicationDelegate Lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        return true
    }
}
