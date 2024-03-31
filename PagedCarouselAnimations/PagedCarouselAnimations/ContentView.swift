//
//  ContentView.swift
//  PagedCarouselAnimations
//
//  Created by Debanjan Chakraborty on 31/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Paged Carousel")
                .frame(alignment: .center)
                .padding(.top, 20)
            PagedCarouselWrapper(contentCellArray: [EmptyCardCanvas(pageNo: 0, color: .red),
                                                    EmptyCardCanvas(pageNo: 1, color: .yellow),
                                                    EmptyCardCanvas(pageNo: 2, color: .green),
                                                    EmptyCardCanvas(pageNo: 3, color: .pink),
                                                    EmptyCardCanvas(pageNo: 4, color: .purple),
                                                    EmptyCardCanvas(pageNo: 5, color: .indigo),
                                                    EmptyCardCanvas(pageNo: 6, color: .cyan),
                                                    EmptyCardCanvas(pageNo: 7, color: .mint)],
                                 horizontalSectionInset: 40,
                                 verticalSectionInset: 20,
                                 lineSpacing: 8) { pageIndex in
                debugPrint("Page visible is \(pageIndex)")
            }
        }
        .padding()
    }
}

struct EmptyCardCanvas: View {
    let pageNo: Int
    let color: Color
    var body: some View {
        color
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                VStack(spacing: 0, content: {
                    Text("Page \(pageNo)")
                })
            }
    }
}
