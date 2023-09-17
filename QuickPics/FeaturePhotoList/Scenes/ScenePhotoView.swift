//
//  ScenePhotoView.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import SwiftUI

struct ScenePhotoView: View {
    
    let data: Unsplash.ImageData
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            CUIImage.Url(string: data.urls.regular, contentMode: .fit)
            VStack(alignment: .leading) {
                HStack {
                    UserImage(urlString: data.user.profileImage.large, size: 50)
                    Text(data.user.username)
                        .fontWeight(.semibold)
                }.padding(20)
                Spacer()
                    if let description = data.description {
                        Text(description)
                    }
                    HStack {
                        Text("\(data.createdAt.toString(format: .short))")
                        Spacer()
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("\(Int(data.likes))")
                    }
                .frame(
                    maxWidth: .infinity,
                    alignment: .bottom
                )
            }.padding(20)
        }
        .foregroundColor(.white)
    }
}
