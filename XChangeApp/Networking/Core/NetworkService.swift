//
//  NetworkService.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import Foundation

protocol NetworkService {
    var session: NetworkSession { get set }
    var urlRequest: URLRequestFactory { get set }
    
    func create<Resource: Encodable>(_ resource: Resource, completion: @escaping (Result<ResourceID, Error>) -> Void)
    func get<Resource: Decodable>(completion: @escaping (Result<[Resource], Error>) -> Void)
}

enum ResourceID {
    case integer(Int)
    case uuid(UUID)
}

struct StandardNetworkService: NetworkService {
    var session: NetworkSession
    var urlRequest: URLRequestFactory
    
    init(session: NetworkSession = URLSession.shared,
         urlRequest: URLRequestFactory) {
        self.session = session
        self.urlRequest = urlRequest
    }
    
    init() {
        let endpoint = StandardEndpoint()
        self.init(urlRequest: StandardURLRequestFactory(endpoint: endpoint))
    }
}
