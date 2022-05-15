//
//  UIViewController.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        view.addSubview(child.view)
        addChild(child)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
