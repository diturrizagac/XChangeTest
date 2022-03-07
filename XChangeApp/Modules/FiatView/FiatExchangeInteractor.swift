//
//  FiatExchangeInteractor.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

class FiatExchangeInteractor: FiatExchangeInteractable {
    weak var presenter: FiatExchangePresenterProtocol?
    var exchangaRate: ExchangeRateEntity?
    var conversionRates: [String: Double]
    
    private var exchangeRateService: ExchangeRateService
    
    init(exchangeRateService: ExchangeRateService = ExchangeRateService()) {
        self.exchangeRateService = exchangeRateService
        self.conversionRates = [:]
    }
}


extension FiatExchangeInteractor: FiatExchangeInteractorServiceRequester {
    func fetchExchange() {
        exchangeRateService.fetchExchangeRate(with: "USD") { [weak self] (result: Result<ExchangeRateEntity, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(String(describing: error))
                    self?.presenter?.onFetchExchangeRateFailure(error)
                    
                case .success(let exchangaRate):
                    self?.exchangaRate = exchangaRate
                    self?.conversionRates = exchangaRate.conversionRates
                    self?.presenter?.onFetchExchangeRateSuccess()
                }
            }
        }
    }
}

extension FiatExchangeInteractor: FiatExchangeInteractorServiceHandler {
    
}
