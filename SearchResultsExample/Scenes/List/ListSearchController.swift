//
//  ListSearchController.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

final class ListSearchController: UISearchController {

    // MARK: - Subviews

    private lazy var feedbackView: ListFeedbackView = {
        let view = ListFeedbackView(frame: .zero)
        setupFeedbackView(view)
        return view
    }()

    // MARK: - Initialization

    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError(UIKitError.notImplemented)
    }

    // MARK: - Functions

    private func setup() {
        searchBar.placeholder = "Search for something..."
    }

    func displayFeedbackView() {
        feedbackView.isHidden = false
    }

    func hideFeedbackView() {
        feedbackView.isHidden = true
    }

    private func setupFeedbackView(_ feedbackView: ListFeedbackView) {
        view.addSubview(feedbackView)

        feedbackView.translatesAutoresizingMaskIntoConstraints = false
        feedbackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        feedbackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        feedbackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        feedbackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
