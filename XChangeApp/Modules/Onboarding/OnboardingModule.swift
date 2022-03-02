//
//  OnboardingModule.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 1/03/22.
//

import UIKit

final class OnboardingModule {
    private var view: OnboardingViewProtocol?
    private var router: OnboardingRouterProtocol
    private var presenter: OnboardingPresenterProtocol
        
    init(view: OnboardingViewProtocol = OnboardingView(),
         router: OnboardingRouterProtocol = OnboardingRouter(),
         presenter: OnboardingPresenterProtocol = OnboardingPresenter()) {
        self.view = view
        self.router = router
        self.presenter = presenter
    }
}

extension OnboardingModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.view = view
        presenter.router = router
        view?.presenter = presenter
        return view as? UIViewController
    }
}
