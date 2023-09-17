//
//  ImageCacheMgr.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import SwiftUI

class ImageCacheMgr: BaseViewModel {
    
    static let shared = ImageCacheMgr()
    var data: [String: Data] = [:]
    
    private init() { }
    
    func getImage(withUrlString urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString)
        else {
            throw ImageCacheManagerError.invalidUrl
        }
        
        if let imageData = data[urlString] {
            guard let image = UIImage(data: imageData)
            else {
                throw ImageCacheManagerError.failedToParseToUIImage
            }
            return image
        } else {
            guard let clients else { throw ClientError.emptyClients }
            let imageData = try await clients.clientNetwork.request(Data.self, on: ImageService(url: url))
            data[urlString] = imageData
            guard let image = UIImage(data: imageData)
            else {
                throw ImageCacheManagerError.failedToParseToUIImage
            }
            return image
        }
    }
}

struct ImageCacheMgrKey: EnvironmentKey {
    
    static var defaultValue: ImageCacheMgr = .shared
}

extension EnvironmentValues {
    
    var imageCacheMgr: ImageCacheMgr {
        get { self[ImageCacheMgrKey.self] }
        set { self[ImageCacheMgrKey.self] = newValue }
    }
}
