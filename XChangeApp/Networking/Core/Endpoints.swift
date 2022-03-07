//
//  Endpoints.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import Foundation

protocol Endpoint {
    var host: String? { get set }
    var path: String? { get set }
    var queryItems: [URLQueryItem]? { get set }
    var scheme: String? { get }
    var port: Int? { get }
    var url: URL? { get }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path ?? ""
        components.queryItems = queryItems
        components.port = port
        return components.url
    }
}

struct StandardEndpoint: Endpoint {
    var path: String?
    var queryItems: [URLQueryItem]? = nil
    var scheme: String? = "https"
    var host: String? = nil
    var port: Int? = nil
}
