A Horizontally paged carousel written in SwiftUI useful for iOS versions 15.x and above

This codebase shows how to implement a horizontally scrollable UICollectionView into your SwiftUI project.

To use in the code, please manually add the following classes into your xcodeproject 
Present in the PagedCarousel folder 
- CarouselPageCell.swift
- PagedCarouselCoordinator.swift
- PagedCarouselLayout.swift
- PagedCarouselWrapper.swift
Present in the Extensions folder
- UIView+Autolayout.swift

  
  Once added, developer can access the paging carousel by implementing the `PagedCarouselWrapper` class onto their View.

  The PagedCarouselWrapper requires the following args: -
  
  - `contentCellArray: `provide your custom swiftUI views here, collated in an array form.
  - `horizontalSectionInset:` provide the horizontal section inset for your carousel
  - `verticalSectionInset:` provide the vertical section inset for your carousel
  - `lineSpacing: `provide the line spacing for your cells. For horizontal collectionView, the lineSpacing works for interItemSpacing
 
    All of these are mandatory variables 

  - `swipeEventHandler` : This is an optional argument that can be used to track which indec is currently being visible
  The sample of this addition can be viewed in `ContentView.swift` file 
