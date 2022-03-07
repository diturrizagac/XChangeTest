//
//  FiatExchangeModule.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

final class FiatExchangeModule {
    private var view: FiatExchangeViewProtocol?
    private var router: FiatExchangeRouterProtocol
    private var interactor: FiatExchangeInteractorProtocol
    private var presenter: FiatExchangePresenterProtocol
        
    init(view: FiatExchangeViewProtocol = FiatExchangeView(),
         router: FiatExchangeRouterProtocol = FiatExchangeRouter(),
         interactor: FiatExchangeInteractorProtocol = FiatExchangeInteractor(),
         presenter: FiatExchangePresenterProtocol = FiatExchangePresenter()) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.presenter = presenter
    }
}

extension FiatExchangeModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view?.presenter = presenter
        return view as? UIViewController
    }
}
