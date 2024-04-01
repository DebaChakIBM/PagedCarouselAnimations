A Horizontally paged carousel written in SwiftUI useful for iOS versions 15.x and above

This codebase shows how to implement a horizontally scrollable UICollectionView into your SwiftUI project.

To use in the code, please manually add the following classes into your codebase and attach them into your xcodeproject's target.

Present in the PagedCarousel folder 
- CarouselPageCell.swift
- PagedCarouselCoordinator.swift
- PagedCarouselLayout.swift
- PagedCarouselWrapper.swift
Present in the Extensions folder
- UIView+Autolayout.swift

Inorder to know how to add pre-existing files into your codebase, please follow the steps mentioned in https://developer.apple.com/documentation/xcode/managing-files-and-folders-in-your-xcode-project#Add-existing-files-and-folders-to-a-project

  
  Once added, developer can access the paging carousel by implementing the `PagedCarouselWrapper` class onto their View.

  The PagedCarouselWrapper requires the following mandatory args: -
  
  - `contentCellArray: `provide your custom swiftUI views here, collated in an array form.
  - `horizontalSectionInset:` provide the horizontal section inset for your carousel
  - `verticalSectionInset:` provide the vertical section inset for your carousel
  - `lineSpacing: `provide the line spacing for your cells. For horizontal collectionView, the lineSpacing works for interItemSpacing

 The following argument is optional in nature.

  - `swipeEventHandler` : This is an optional argument that can be used to track which indec is currently being visible
  
  The sample of this addition can be viewed in `ContentView.swift` file 
