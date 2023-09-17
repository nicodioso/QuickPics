//
//  UnsplashService.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/17/23.
//

import Foundation

enum UnsplashService: ServiceProtocol {
    case getImages(page: Int, accessKey: String)
    
    var url: URL {
        switch self {
        case .getImages:
            return .init(string: "https://api.unsplash.com/photos")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getImages:
            return .get
        }
    }
    
    var config: ServiceProtocolConfig? {
        switch self {
        case let .getImages(page, accessKey):
            return .init(queryParams: [
                "page": "\(page)",
                "client_id": accessKey,
            ])
        default:
            return nil
        }
    }
}
