//
//  OnboardingPresenter.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 1/03/22.
//

import UIKit

final class OnboardingPresenter: OnboardingPresentable {
    
    weak var view: OnboardingViewProtocol?
    var router: OnboardingRouterProtocol
    
    init(view: OnboardingViewProtocol? = nil,
         router: OnboardingRouterProtocol = OnboardingRouter()) {
        self.view = view
        self.router = router
    }
}

extension OnboardingPresenter: OnboardingPresenterViewConfiguration {
    func didFinishOnboarding() {
        router.showLogin()
    }
    
}
