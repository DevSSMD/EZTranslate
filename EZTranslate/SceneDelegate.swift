//
//  SceneDelegate.swift
//  EZTranslate
//
//  Created by Sana Siddiqui on 2/27/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
           let viewController = TranslateViewController()

           let window = UIWindow(windowScene: windowScene)

           window.rootViewController = createTabBar()

           window.makeKeyAndVisible()
           self.window = window
    }
    
    func createSearchNavController() -> UINavigationController {
        let searchVC = SelectLanguageVC()
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    func createTranslateNavController() -> UINavigationController {
        let translateVC = TranslateViewController()
        translateVC.tabBarItem = UITabBarItem(title: "Translate", image: UIImage(systemName: "mic.badge.plus"), tag: 0)
        
        return UINavigationController(rootViewController: translateVC)
    }
    
    func createFavoritesNavController() -> UINavigationController {
        let favoritesVC = FavoritesVC()
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemYellow
        tabBar.tabBar.backgroundColor = .systemBackground
        tabBar.viewControllers = [createSearchNavController(), createTranslateNavController(), createFavoritesNavController()]
        
        return tabBar
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

