//
//  Unsplash+Image.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import Foundation

extension Unsplash {
    struct ImageData: Codable, Identifiable {
        
        let id: String
        let createdAt: Date
        let width: Double
        let height: Double
        let description: String?
        let likes: Double
        let urls: Urls
        let user: User
        
        struct Urls: Codable {
            
            let regular: String
        }
    }

}
