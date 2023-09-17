//
//  Clients.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import Foundation

class Clients {
    
    var clientNetwork: ClientNetwork
    var clientUnsplash: ClientUnsplash
    
    init(clientNetwork: ClientNetwork, clientUnsplash: ClientUnsplash) {
        self.clientNetwork = clientNetwork
        self.clientUnsplash = clientUnsplash
    }
}

extension Clients {
    static let live: Clients = {
        return .init(
            clientNetwork: ClientNetworkLive(
                urlSession: .shared,
                decoder: {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    return decoder
                }(),
                encoder: .init()
            ),
            clientUnsplash: ClientUnsplashLive()
        )
    }()
}
