//
//  NSDirectionalEdgeInsets.swift
//  SearchResultsExample
//
//  Created by Tiago on 04/05/2022.
//

import UIKit

extension NSDirectionalEdgeInsets {
    init(withEqualValue inset: CGFloat) {
        self.init(top: inset,
                  leading: inset,
                  bottom: inset,
                  trailing: inset)
    }
}
