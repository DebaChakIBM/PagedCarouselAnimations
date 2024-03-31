//
//  UIView+Autolayout.swift
//  PagedCarouselAnimations
//
//  Created by Debanjan Chakraborty on 31/03/24.
//

import Foundation
import UIKit

extension UIView {
    func matchSuperview(padding: UIEdgeInsets = .zero, useSafeArea: Bool = false) {
        guard let superview else { return }

        let constraintsArray: [NSLayoutConstraint]

        if useSafeArea {
            constraintsArray = [
                superview.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topAnchor, constant: -padding.top),
                superview.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom),
                superview.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -padding.left),
                superview.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right)
            ]
        } else {
            constraintsArray = [
                superview.topAnchor.constraint(equalTo: topAnchor, constant: -padding.top),
                superview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom),
                superview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -padding.left),
                superview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right)
            ]
        }

        NSLayoutConstraint.activate(constraintsArray)
    }
}
