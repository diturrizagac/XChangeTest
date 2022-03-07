//
//  FiatExchangeProtocols.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

// MARK: - View
typealias FiatExchangeViewProtocol = FiatExchangeViewable & FiatExchangeViewConfigurable & FiatExchangeViewReloadable & ErrorHandler

protocol FiatExchangeViewable: AnyObject {
    var presenter: FiatExchangePresenterProtocol { get set }
}

protocol FiatExchangeViewConfigurable: AnyObject {
    func configureTitle(title: String)
    func setViewInteraction(_ enabled: Bool)
}

protocol FiatExchangeViewReloadable: AnyObject {
    func reloadData()
    //func reloadRow(_ row: Int)
}

// MARK: - Interactor
typealias FiatExchangeInteractorProtocol = FiatExchangeInteractable & FiatExchangeInteractorServiceRequester & FiatExchangeInteractorServiceHandler

protocol FiatExchangeInteractable: AnyObject {
    var presenter: FiatExchangePresenterProtocol? { get set }
}

protocol FiatExchangeInteractorServiceRequester: AnyObject {
    func fetchExchange()
}

protocol FiatExchangeInteractorServiceHandler: AnyObject {
    var exchangaRate: ExchangeRateEntity? { get set }
    var conversionRates: [String:Double] { get set }
}

// MARK: - Presenter
typealias FiatExchangePresenterProtocol = FiatExchangePresentable & FiatExchangePresenterViewConfiguration & FiatExchangePresenterDataSource & FiatExchangePresenterServiceInteractable & FiatExchangePresenterServiceHandler

protocol FiatExchangePresentable: AnyObject {
    var view: FiatExchangeViewProtocol? { get set }
    var interactor: FiatExchangeInteractorProtocol { get set }
    var router: FiatExchangeRouterProtocol { get set }
}

protocol FiatExchangePresenterViewConfiguration: AnyObject {
    func viewDidLoad()
    func refreshData()
}

protocol FiatExchangePresenterServiceInteractable: AnyObject {
    func fetchExchange()
    func updateRates(using text: String)
}

protocol FiatExchangePresenterServiceHandler: AnyObject {
    func onFetchExchangeRateSuccess()
    func onFetchExchangeRateFailure(_ error: Error)
}

protocol FiatExchangePresenterDataSource: AnyObject {
    var numberOfRows: Int { get }
    var cellModelArray: [GenericCellModel] { get }
    func didSelectRow(at index: Int)
}


// MARK: - Router
protocol FiatExchangeRouterProtocol: AnyObject {
    func dummyFunc()
}
