//
//  ServiceProtocol.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/17/23.
//

import Foundation

/**
 Services could be grouped via enum implementation.
 
        enum UserService: ServiceProtocol {
            case getUser(id: Int)
            
            var url: URL {
                switch self {
                case .getUser(let id):
                    return URL(string: "https://someurl.com/user/\(id)")!
                }
            }
 
            // .. The rest of protocol properties/functions
        }
 
 Or for single usages:
            
        struct GoogleMapGetLocation: ServiceProtocol {
            
            let url = URL(string: "https://maps.google.com/sample")
        }
 */
protocol ServiceProtocol {
    
    var url: URL { get }
    var method: HTTPMethod { get }
    
    // Optional configurations
    var config: ServiceProtocolConfig? { get }
    
    /* Add as needed
     var headers: [String: String] { get }
     */
}
