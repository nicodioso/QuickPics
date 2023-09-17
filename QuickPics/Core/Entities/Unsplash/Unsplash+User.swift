//
//  Unsplash+User.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import Foundation

extension Unsplash {
    struct User: Codable {
        
        let id: String
        let username: String
        let profileImage: ProfileImageUrls
        
        struct ProfileImageUrls: Codable {
            let large: String
        }
    }
}
