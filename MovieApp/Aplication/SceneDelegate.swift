//
//  SceneDelegate.swift
//  Movie
//
//  Created by Vanopr on 24.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UDService.ifOnboardingCompleted() ? Builder.createTabBar() : Builder.createOnboarding()//        window?.rootViewController = NavigationController(rootViewController: MovieListsAssembly().build())
        window?.makeKeyAndVisible()
    }
}
