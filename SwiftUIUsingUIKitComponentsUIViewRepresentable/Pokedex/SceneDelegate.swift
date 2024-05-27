//
//  SceneDelegate.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func scene(
        _ scene: UIScene, willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let nav = UINavigationController()
        coordinator = AppCoordinator(navigationController: nav)
        coordinator?.start()

        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
}
