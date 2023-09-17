//
//  ClientNetworkLive.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/17/23.
//

import Foundation

class ClientNetworkLive: ClientNetwork {
    
    private var urlSession: URLSession
    private var decoder: JSONDecoder
    private var encoder: JSONEncoder
    
    required init(urlSession: URLSession, decoder: JSONDecoder, encoder: JSONEncoder) {
        self.urlSession = urlSession
        self.decoder = decoder
        self.encoder = encoder
    }
    
    func request<T: Codable>(_ type: T.Type, on service: ServiceProtocol) async throws -> T {
        let request = URLRequest(service: service)
        let (data, _) = try await urlSession.data(for: request)
        if let data = data as? T {
            return data
        } else {        
            return try decoder.decode(T.self, from: data)
        }
    }
}
