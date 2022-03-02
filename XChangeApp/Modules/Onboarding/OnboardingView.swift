//
//  OnboardingView.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 1/03/22.
//

import UIKit

final class OnboardingView: UIPageViewController, OnboardingViewable {
    
    var presenter: OnboardingPresenterProtocol = OnboardingPresenter()
    
    private lazy var pageViewControllers: [UIViewController] = {
        var pages = [UIViewController]()
        pages.append(WelcomePageView())
        pages.append(InformativePageView())
        pages.append(ExitPageView())
        return pages
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.frame = CGRect()
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = pageViewControllers.count
        return pageControl
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didContinueAction), for: .touchUpInside)
        return button
    }()
    
    private var staticConstraints: [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: [
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        ])
        constraints.append(contentsOf: [
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -10),
        ])
        return constraints
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .white
        configurePager()
        addViews()
    }
    
    private func configurePager() {
        dataSource = self
        delegate = self
        let initialPage = 0
        setViewControllers([pageViewControllers[initialPage]], direction: .forward, animated: true, completion: nil)
        pageControl.currentPage = initialPage
    }
    
    private func addViews() {
        view.addSubview(pageControl)
        view.addSubview(continueButton)
        NSLayoutConstraint.activate(staticConstraints)
    }
    
    @objc private func didContinueAction() {
        presenter.didFinishOnboarding()
    }
}

extension OnboardingView: OnboardingViewConfigurable {

}

extension OnboardingView: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageViewControllers.firstIndex(of: viewController) else { return nil }
        return viewControllerIndex != 0 ? pageViewControllers[viewControllerIndex - 1] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageViewControllers.firstIndex(of: viewController) else { return nil }
        return viewControllerIndex < pageViewControllers.count - 1 ? pageViewControllers[viewControllerIndex + 1] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let pageContentViewController = pageViewController.viewControllers?[0],
              let currentPage = pageViewControllers.firstIndex(of: pageContentViewController) else { return }
        pageControl.currentPage = currentPage
    }
}
