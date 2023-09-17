//
//  ImageService.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import Foundation

struct ImageService: ServiceProtocol {
    
    var url: URL
    let method: HTTPMethod = .get
    var config: ServiceProtocolConfig?
}
