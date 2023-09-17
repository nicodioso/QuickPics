//
//  CUIImage+Url.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import SwiftUI

extension CUIImage {
    struct Url: View {
        
        @Environment(\.imageCacheMgr) private var imageCacheMgr
        let string: String
        var contentMode: ContentMode = .fill
        
        @State private var isFailed = false
        @State private var image: UIImage? = nil
        
        @ViewBuilder
        var body: some View {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            } else if isFailed {
                Rectangle().fill(Color.gray).frame(height: 150)
                    .overlay {
                        Text("Failed to load image")
                    }
            } else {
                Rectangle().fill(Color.gray).frame(height: 150)
                    .task {
                        do {
                            image = try await imageCacheMgr.getImage(withUrlString: string)
                        } catch {
                            isFailed = true
                        }
                    }
            }
        }
    }
}
