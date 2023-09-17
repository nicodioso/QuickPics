//
//  CUIImage+ListItem.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import SwiftUI

extension CUIImage {
    struct ListItem: View {
        
        let data: Unsplash.ImageData
        
        var body: some View {
            CUIImage.Url(string: data.urls.regular)
                .overlay(alignment: .bottom) {
                    LinearGradient(
                        colors: [
                            .clear,
                            .black.opacity(0.5)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ).frame(height: 110)
                }
                .overlay(alignment: .bottomLeading) {
                    HStack(alignment: .top) {
                        UserImage(urlString: data.user.profileImage.large, size: 50)
                        VStack(alignment: .leading)  {
                            Text(data.user.username)
                                .fontWeight(.semibold)
                            if let description = data.description {
                                Text(description)
                                    .lineLimit(1)
                            }
                        }
                        .foregroundColor(.white)
                    }
                    .padding(30)
                }
                .cornerRadius(15)
        }
    }
}
