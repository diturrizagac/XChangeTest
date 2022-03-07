//
//  FiatExchangePresenter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

class FiatExchangePresenter: FiatExchangePresentable {
    weak var view: FiatExchangeViewProtocol?
    var interactor: FiatExchangeInteractorProtocol
    var router: FiatExchangeRouterProtocol

    init(interactor: FiatExchangeInteractorProtocol = FiatExchangeInteractor(),
         router: FiatExchangeRouterProtocol = FiatExchangeRouter()) {
        self.interactor = interactor
        self.router = router
    }
}

extension FiatExchangePresenter: FiatExchangePresenterViewConfiguration {
    func viewDidLoad() {
        fetchExchange()
    }
    
    func refreshData() {
        interactor.exchangaRate?.conversionRates.removeAll()
        view?.reloadData()
        fetchExchange()
    }
}

extension FiatExchangePresenter: FiatExchangePresenterServiceInteractable {
    func fetchExchange() {
        view?.setViewInteraction(false)
        interactor.fetchExchange()
    }
    
    func updateRates(using text: String) {
        var conversionRatesFiltered = [String:Double]()
        if text.isEmpty {
            conversionRatesFiltered = interactor.conversionRates
        } else {
            conversionRatesFiltered = interactor.exchangaRate?.conversionRates.filter({
                $0.key.contains(text)
            }) ?? [:]
        }
        interactor.exchangaRate?.conversionRates = conversionRatesFiltered
        view?.reloadData()
    }
}

extension FiatExchangePresenter: FiatExchangePresenterServiceHandler {
    func onFetchExchangeRateSuccess() {
        view?.setViewInteraction(true)
        view?.reloadData()
    }
    
    func onFetchExchangeRateFailure(_ error: Error) {
        view?.setViewInteraction(true)
        view?.handleError(title: "Error", message: String(describing: error))
    }
}

extension FiatExchangePresenter: FiatExchangePresenterDataSource {
    var cellModelArray: [GenericCellModel] {
        guard let conversionRates = interactor.exchangaRate?.conversionRates else { return [] }
        return buildCellModel(conversionRates: conversionRates)
    }
    
    var numberOfRows: Int {
        return interactor.exchangaRate?.conversionRates.count ?? 0
    }
    
    func didSelectRow(at index: Int) {
        
    }
    
}

extension FiatExchangePresenter {
    private func buildCellModel(conversionRates: [String:Double]) -> [GenericCellModel] {
        guard !conversionRates.isEmpty else { return [] }
        return conversionRates.compactMap {
            GenericCellModel(title: $0.key, subTitle: String($0.value))
        }.sorted(by: {$0.title < $1.title})
    }
}
