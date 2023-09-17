//
//  ClientNetwork.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/17/23.
//

import Foundation

protocol ClientNetwork {
    
    init(urlSession: URLSession, decoder: JSONDecoder, encoder: JSONEncoder)
    
    func request<T: Codable>(_ type: T.Type, on service: ServiceProtocol) async throws -> T
}
