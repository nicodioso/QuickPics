//
//  ScenePhotoList.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/17/23.
//

import SwiftUI

struct ScenePhotoList: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(viewModel.imageData) { one in
                    CUIImage.ListItem(data: one)
                        .onTapGesture {
                            viewModel.handleTap(of: one)
                        }
                }
                
                CUIPageComponents.PaginationLoader(isLoading: viewModel.isLoadingNextPage) {
                    Task {
                        await viewModel.fetchNextImages()
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .overlay {
            if viewModel.imageData.isEmpty {
                Text("No images")
            }
        }
        .sheet(item: $viewModel.viewedImage) { image in
            ScenePhotoView(data: image)
        }
        .task {
            await viewModel.fetchNextImages()
        }
        .alert("Something went wrong.", isPresented: $viewModel.isSomethingWentWrongShown ) {
            Button("Dismiss") {
                viewModel.hideAlert()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScenePhotoList()
    }
}
