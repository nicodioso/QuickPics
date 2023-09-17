//
//  CUIPageComponents.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import SwiftUI

enum CUIPageComponents { }

extension CUIPageComponents {
    struct PaginationLoader: View {
        
        @Environment(\.nextPageInfo) private var nextPageInfo: NextPageLoaderInfo?
        let isLoading: Bool
        let onScrolledToEdge: ()->()
        
        var body: some View {
            ZStack {
                GeometryReader { geo in
                    if let nextPageInfo = nextPageInfo {
                        if geo.frame(in: .named(nextPageInfo.spaceName)).midY < nextPageInfo.scrollViewHeight + 150 {
                            Spacer().onAppear {
                                onScrolledToEdge()
                            }
                        }
                    }
                }
                if isLoading {
                    ProgressView()
                }
            }
        }
    }
}

private struct NextPageLoaderInfo {
    let scrollViewHeight: CGFloat
    let spaceName: String
}

private struct NextPageKey: EnvironmentKey {
    static let defaultValue: NextPageLoaderInfo? = nil
}

extension EnvironmentValues {
    fileprivate var nextPageInfo: NextPageLoaderInfo? {
        get { self[NextPageKey.self] }
        set { self[NextPageKey.self] = newValue }
    }
}

fileprivate struct NextPageLoaderModifier: ViewModifier {
 
    let spaceName: String
    @State private var scrollViewHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { hGeo -> Color in
                    DispatchQueue.main.async {
                        scrollViewHeight = hGeo.size.height
                    }
                    return Color.clear
                }
            )
            .coordinateSpace(name: spaceName)
            .environment(
                \.nextPageInfo,
                 .init(scrollViewHeight: scrollViewHeight,
                       spaceName: spaceName))
    }
}

/// Apply modifier to scroll view
extension View {
    func paginatedScrollView() -> some View {
        let spaceName = UUID().uuidString
        return modifier(NextPageLoaderModifier(spaceName: spaceName))
    }
}
