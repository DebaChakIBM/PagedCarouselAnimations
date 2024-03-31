//
//  PagedCarouselCoordinator.swift
//  PagedCarouselAnimations
//
//  Created by Debanjan Chakraborty on 31/03/24.
//

import SwiftUI
import UIKit
public final class PagedCarouselCoordinator<Content: View>: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {

    let hostView: UIView
    private let collectionView: UICollectionView
    private let swipePageEventHandler: ((Int) -> Void)?
    private var cells: [Content] =  []

    init(horizontalSectionInset: CGFloat,
         verticalSectionInset: CGFloat,
         lineSpacing: CGFloat,
         swipeEvent: ((Int) -> Void)?) {
        self.swipePageEventHandler = swipeEvent

        let layout = PagedCarouselLayout(horizontalSectionInset: horizontalSectionInset,
                                         verticalSectionInset: verticalSectionInset,
                                         lineSpacing: lineSpacing)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        hostView = UIView()
        hostView.addSubview(collectionView)
        collectionView.matchSuperview()

        layout.update(with: hostView)
        super.init()
        setupCollectionView()
    }

    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.register(CarouselPageCell.self, forCellWithReuseIdentifier: CarouselPageCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.decelerationRate = .fast
    }

    func reloadData(with contentCells: [Content]) {
        self.cells = contentCells

        if Thread.isMainThread {
            self.collectionView.reloadData()
        } else {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { cells.count }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item < cells.count, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselPageCell.reuseIdentifier, for: indexPath) as? CarouselPageCell else { return UICollectionViewCell() }
        cell.updateContent(AnyView(cells[indexPath.item]))
        return cell
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let swipePageEventHandler else { return }
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        collectionView.scrollToItem(at: visibleIndexPath, at: .centeredHorizontally, animated: false)
        swipePageEventHandler(visibleIndexPath.item)
    }
}
