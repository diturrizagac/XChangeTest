//
//  CreateNetworkService.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

extension NetworkService {
    func create<Resource: Encodable>(_ resource: Resource, completion: @escaping (Result<ResourceID, Error>) -> Void) {
        var request = urlRequest.makeURLRequest()
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(resource)
        
        session.loadData(from: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                completion(.failure(ServiceError.unexpectedResponse))
                return
            }
            
            guard let resourceIdLocation = httpResponse.allHeaderFields["Location"] as? String else {
                completion(.failure(ServiceError.locationHeaderNotFound))
                return
            }
            
            guard let resourceId = resourceIdLocation.components(separatedBy: "/").last else {
                completion(.failure(ServiceError.resourceIDNotFound))
                return
            }
            
            if let resourceUUID = UUID(uuidString: resourceId) {
                completion(.success(ResourceID.uuid(resourceUUID)))
            } else if let resourceIntID = Int(resourceId) {
                completion(.success(ResourceID.integer(resourceIntID)))
            } else {
                completion(.failure(ServiceError.unexpectedResourceIDType))
            }
        }
    }
}
