//
//  CarouselPageCell.swift
//  PagedCarouselAnimations
//
//  Created by Debanjan Chakraborty on 31/03/24.
//

import UIKit
import SwiftUI

public final class CarouselPageCell: UICollectionViewCell {
    static let reuseIdentifier: String = CarouselPageCell.description()
    private var hostingViewController: UIHostingController<AnyView>?

    func updateContent(_ content: AnyView) {
        if let hostingViewController {
            hostingViewController.view.removeFromSuperview()
            hostingViewController.rootView = content
        } else {
            hostingViewController = UIHostingController(rootView: content)
        }
        setUp()
    }

    fileprivate func setUp() {
        guard let view = hostingViewController?.view else { return }
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)

        view.matchSuperview()
    }
}
