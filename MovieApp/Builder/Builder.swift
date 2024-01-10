//
//  Builder.swift
//  MovieApp
//
//  Created by Vanopr on 24.12.2023.
//

import UIKit
import KPNetwork

final class Builder {
    
//    TabBarVC
    static func createTabBar() -> UIViewController {
        let view = TabBarController(customTabBar: TabBar())
        let presenter = TabBarPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
// Home
    static func createHome() -> UIViewController {
        
        let presenter = HomePresenter(networkService: DIContainer.shared.networkService)
        let view = HomeViewController(homeView: HomeCollectionView(), presenter: presenter, navigationAndSearchBarView: NavigationAndSearchBarView())
        presenter.view = view
        view.presenter = presenter
        return view
    }
    
    // Search
    static func createSearch() -> UIViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    // Tree
    static func createTree() -> UIViewController {
        SuggestionsAssembly().build()
    }
    
    // Profile
    static func createProfile() -> UIViewController {
        let view = ProfileViewController()
        let router = ProfileRouter()
        router.controller = view
        let realmService = RealmService()
        let presenter = ProfilePresenter(view: view, router: router, realmService: realmService)
        view.presenter = presenter
        return view
    }
    
    static func createOnboarding() -> UIViewController {
        let view = OnboardingViewController()
        let router = OnboardingRouter()
        router.controller = view
        let presenter = OnboardingPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
