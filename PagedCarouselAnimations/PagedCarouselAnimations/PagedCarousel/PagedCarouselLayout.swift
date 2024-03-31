//
//  PagedCarouselLayout.swift
//  PagedCarouselAnimations
//
//  Created by Debanjan Chakraborty on 31/03/24.
//

import UIKit

public final class PagedCarouselLayout: UICollectionViewFlowLayout {

    weak var hostView: UIView?
    private let horizontalSectionInset: CGFloat
    private let verticalSectionInset: CGFloat
    private let lineSpacing: CGFloat
    private var currentPage: Int = 0
    private var currentXOffset: CGFloat = 0.0

    init(horizontalSectionInset: CGFloat, verticalSectionInset: CGFloat, lineSpacing: CGFloat) {
        self.horizontalSectionInset = horizontalSectionInset
        self.verticalSectionInset = verticalSectionInset
        self.lineSpacing = lineSpacing
        super.init()
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func update(with newHostView: UIView) {
        self.hostView = newHostView
        setup()
    }

    private func setup() {
        guard let hostView else { return }
        sectionInset = UIEdgeInsets(top: verticalSectionInset,
                                    left: horizontalSectionInset,
                                    bottom: verticalSectionInset,
                                    right: horizontalSectionInset)

        let itemWidth = max(hostView.bounds.size.width - horizontalSectionInset * 2, 10.0)
        let itemHeight = max(hostView.bounds.size.width - verticalSectionInset * 2, 10.0)
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        minimumLineSpacing = lineSpacing
        scrollDirection = .horizontal
    }

    public override func prepare() {
        setup()
    }

    public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                             withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }

        let pageCount = collectionView.numberOfItems(inSection: 0)

        var nextPage = currentPage
        if currentXOffset > collectionView.contentOffset.x && velocity.x < 0 {
            // go to the previous cell
            nextPage = currentPage - 1
            if nextPage < 0 { nextPage = 0 }
        } else if currentXOffset < collectionView.contentOffset.x && velocity.x > 0 {
            // go to the next cell
            nextPage = min(currentPage + 1, pageCount - 1)
        }
        guard nextPage != currentPage else {
            return CGPoint(x: currentXOffset, y: proposedContentOffset.y)
        }
        // update the currentPage and the xOffset
        let pageWidth = itemSize.width + minimumLineSpacing
        currentPage = nextPage
        currentXOffset = pageWidth * CGFloat(currentPage)
        return CGPoint(x: currentXOffset, y: proposedContentOffset.y)
    }
}
