//
//  NetworkSession.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import Foundation

protocol NetworkSession {
    func loadData(from urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func loadData(from urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task  = dataTask(with: urlRequest) { [weak self] (data, response, error) in
            self?.showData(data: data)
            completionHandler(data, response, error)
        }
        
        task.resume()
    }
    
    private func showData(data: Data?) {
        guard let data = data else { return }
        do {
            let jsonData: Data = data
            let jsonDict = try JSONSerialization.jsonObject(with: jsonData) as? NSDictionary
            print(jsonDict as Any)
        } catch {
            print(error.localizedDescription)
        }
    }
}

enum ServiceError: Error {
    case unexpectedResponse
    case locationHeaderNotFound
    case resourceIDNotFound
    case unexpectedResourceIDType
    case expectedDataInResponse
    case invalidRequestData
}
