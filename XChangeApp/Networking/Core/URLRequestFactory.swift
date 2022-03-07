//
//  URLRequestFactory.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import Foundation

protocol URLRequestFactory {
    func makeURLRequest() -> URLRequest
    var defaultHeaders: [String: String] { get }
    var endpoint: Endpoint { get set }
}

extension URLRequestFactory {
    var defaultHeaders: [String: String] {
        return [:]
    }
}

struct StandardURLRequestFactory: URLRequestFactory {
    var endpoint: Endpoint
    
    func makeURLRequest() -> URLRequest {
        guard let url = endpoint.url else {
            fatalError("Unable to make url request")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = defaultHeaders
        return urlRequest
    }
}
