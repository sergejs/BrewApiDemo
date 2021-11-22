//
//  SceneDelegate.swift
//  LetsBrew
//
//  Created by Sergejs Smirnovs on 21.11.21.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let navigationController = UINavigationController()
    lazy var coordinator = ListCoordinator(navigationController: navigationController)

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let _ = (scene as? UIWindowScene) else { return }

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            coordinator.start()
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
