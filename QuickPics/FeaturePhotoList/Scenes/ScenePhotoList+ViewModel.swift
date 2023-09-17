//
//  ScenePhotoList+ViewModel.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import SwiftUI

extension ScenePhotoList {
    @MainActor
    class ViewModel: BaseViewModel {
        
        private var currentPage = 0
        @Published var imageData: [Unsplash.ImageData] = []
        @Published var isSomethingWentWrongShown = false
        @Published var viewedImage: Unsplash.ImageData? = nil
        
        func fetchNextImages() async {
            do {
                guard let clients else { return }
                let data = try await clients.clientNetwork.request(
                    [Unsplash.ImageData].self,
                    on: UnsplashService.getImages(
                        page: currentPage + 1,
                        accessKey: clients.clientUnsplash.accessToken
                    )
                )
                currentPage += 1
                imageData += data
            } catch {
                isSomethingWentWrongShown = true
            }
        }
        
        func hideAlert() {
            isSomethingWentWrongShown = false
        }
        
        func handleTap(of data: Unsplash.ImageData) {
            viewedImage = data
        }
    }
}
