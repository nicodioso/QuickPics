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
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    
                    decoder.dateDecodingStrategy = .custom({ decoder in
                        let container = try decoder.singleValueContainer()
                        let dateString = try container.decode(String.self)

                        guard let date = dateFormatter.date(from: dateString) else {
                            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
                        }
                        return date
                    })
                    return decoder
                }(),
                encoder: .init()
            ),
            clientUnsplash: ClientUnsplashLive()
        )
    }()
}
