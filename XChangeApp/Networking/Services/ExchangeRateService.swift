//
//  ExchangeRateService.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

struct ExchangeRateService: NetworkService {
    var session: NetworkSession
    var urlRequest: URLRequestFactory
    
    init(session: NetworkSession = URLSession.shared,
         urlRequest: URLRequestFactory = StandardURLRequestFactory(endpoint: StandardEndpoint())) {
        self.session = session
        self.urlRequest = urlRequest
    }
    
    mutating func fetchExchangeRate(with currency: String,
                                    completion: @escaping (Result<ExchangeRateEntity, Error>) -> Void) {
        var exchangeRateEndpoint = urlRequest.endpoint
        exchangeRateEndpoint.host = GlobalData.exchangeRateBaseHost
        exchangeRateEndpoint.path = "/v6/\(GlobalData.apiKey)/latest/\(currency)"
        urlRequest.endpoint = exchangeRateEndpoint
        
        var request = urlRequest.makeURLRequest()
        request.httpMethod = "GET"
        
        session.loadData(from: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, data.isEmpty == false else {
                completion(.failure(ServiceError.unexpectedResponse))
                return
            }
            
            do {
                let exchangeRate = try JSONDecoder().decode(ExchangeRateEntity.self, from: data)
                completion(.success(exchangeRate))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
