//
//  UIView.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        subviews.forEach(addSubview)
    }

    func round() {
        clipsToBounds = true
        layer.cornerRadius = 10
    }
}
