//
//  SceneDelegate.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let rootVC = ListUsersViewController()
        self.window?.rootViewController = UINavigationController(rootViewController: rootVC)
        self.window?.makeKeyAndVisible()
    }
}

