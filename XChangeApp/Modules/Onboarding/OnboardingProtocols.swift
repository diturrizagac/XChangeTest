//
//  OnboardingProtocols.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 1/03/22.
//


// MARK: - View
typealias OnboardingViewProtocol = OnboardingViewable & OnboardingViewConfigurable

protocol OnboardingViewable: AnyObject {
    var presenter: OnboardingPresenterProtocol { get set }
}

protocol OnboardingViewConfigurable: AnyObject {
    
}

// MARK: - Presenter
typealias OnboardingPresenterProtocol = OnboardingPresentable & OnboardingPresenterViewConfiguration

protocol OnboardingPresentable: AnyObject {
    var view: OnboardingViewProtocol? { get set }
    var router: OnboardingRouterProtocol { get set }
}

protocol OnboardingPresenterViewConfiguration: AnyObject {
    func didFinishOnboarding()
}

// MARK: - Router
protocol OnboardingRouterProtocol: AnyObject {
    func showLogin()
}
