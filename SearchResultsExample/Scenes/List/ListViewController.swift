//
//  ListViewController.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class ListViewController: UIViewController {

    // MARK: - Properties

    private let collectionViewController: ListCollectionViewController
    private let searchController: ListSearchController
    private let viewModel: ListViewModelProtocol

    // MARK: - Initialization

    init(collectionViewController: ListCollectionViewController,
         searchController: ListSearchController,
         viewModel: ListViewModel) {
        self.collectionViewController = collectionViewController
        self.searchController = searchController
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupNavigationBar()
        setupSearchBar()
    }

    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupContent()
    }

    // MARK: - Setups

    private func setupNavigationBar() {
        title = "List"
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Login",
                                                         style: .done,
                                                         target: self,
                                                         action: #selector(loginButtonTapped)),
                                         animated: false)
    }

    private func setupSearchBar() {
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.showsSearchResultsController = true
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func setupSubviews() {
        add(collectionViewController)
    }

    private func setupContent() {
        viewModel.loadPokemon {
            switch $0 {
            case let .success(group):
                self.collectionViewController.update(with: group)
            case .error:
                return
            }
        }
    }

    // MARK: - Selectors

    @objc private func loginButtonTapped(_ sender: UIBarButtonItem) {
        print(#function)
    }
}

// MARK: - UISearchResultsUpdating

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.count > viewModel.maximumTextLength {
            self.searchController.displayFeedbackView()
        } else {
            self.searchController.hideFeedbackView()
        }
    }
}
