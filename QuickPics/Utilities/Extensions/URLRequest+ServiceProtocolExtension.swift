//
//  URLRequest+ServiceProtocolExtension.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/17/23.
//

import Foundation

extension URLRequest {
    
    init(service: ServiceProtocol) {
        var url = service.url
        if let config = service.config,
           let queryParams = config.queryParams {
            url.append(queryItems: queryParams.map{ .init(name: $0, value: $1) })
        }
        self.init(url: url)
    }
}
