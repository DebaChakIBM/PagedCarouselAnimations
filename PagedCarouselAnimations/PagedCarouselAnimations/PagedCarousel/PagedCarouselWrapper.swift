//
//  PagedCarouselWrapper.swift
//  PagedCarouselAnimations
//
//  Created by Debanjan Chakraborty on 31/03/24.
//

import SwiftUI
import Foundation
import UIKit

struct PagedCarouselWrapper<Content: View>: UIViewRepresentable {
    var contentCellArray: [Content]
    var swipeEvent: ((Int) -> Void)?
    private let horizontalSectionInset: CGFloat
    private let verticalSectionInset: CGFloat
    private let lineSpacing: CGFloat

    func makeUIView(context: Context) -> UIView { context.coordinator.hostView }

    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.reloadData(with: contentCellArray)
    }

    func makeCoordinator() -> PagedCarouselCoordinator<Content> {
        PagedCarouselCoordinator(horizontalSectionInset: horizontalSectionInset,
                                 verticalSectionInset: verticalSectionInset,
                                 lineSpacing: lineSpacing,
                                 swipeEvent: swipeEvent)
    }

    public init(contentCellArray: [Content],
                horizontalSectionInset: CGFloat,
                verticalSectionInset: CGFloat,
                lineSpacing: CGFloat,
                swipeEvent: ( (Int) -> Void)? = nil) {
        self.contentCellArray = contentCellArray
        self.swipeEvent = swipeEvent
        self.horizontalSectionInset = horizontalSectionInset
        self.verticalSectionInset = verticalSectionInset
        self.lineSpacing = lineSpacing
    }
}
