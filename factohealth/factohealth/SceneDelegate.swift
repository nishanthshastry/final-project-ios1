//
//  SceneDelegate.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 21/02/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)

        // Load from Main.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Make sure the identifier is set in Storyboard
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.showTabBarController()
        }
    }
    
    private func showTabBarController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        // Instantiate view controllers using their Storyboard IDs
        let newsVC = storyboard.instantiateViewController(identifier: "NewsViewController") as! NewsViewController
//        let navNewsVC = storyboard.instantiateViewController(identifier: "UITabBarController") as! UITabBarController
        let bmiVC = storyboard.instantiateViewController(identifier: "BMIViewController") as! BMIViewController
        let homeVC = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let kyoVC = storyboard.instantiateViewController(identifier: "KYOViewController") as! KYOViewController
        let medicineScanVC = storyboard.instantiateViewController(identifier: "MedicineScanViewController") as! MedicineScanViewController
        
        let navNewsVC = UINavigationController(rootViewController: newsVC)
        let navKyoVC = UINavigationController(rootViewController: kyoVC)
        
        // Assign tab bar items
//        newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 0)
        navNewsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 0)
        bmiVC.tabBarItem = UITabBarItem(title: "BMI", image: UIImage(systemName: "figure.gymnastics.circle"), tag: 1)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 2)
//        kyoVC.tabBarItem = UITabBarItem(title: "KYO", image: UIImage(systemName: "accessibility.fill"), tag: 3)
        navKyoVC.tabBarItem = UITabBarItem(title: "KYO", image: UIImage(systemName: "accessibility.fill"), tag: 3)
        medicineScanVC.tabBarItem = UITabBarItem(title: "Medi Scan", image: UIImage(systemName: "heart.text.clipboard"), tag: 4)

        // Create Tab Bar Controller
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navNewsVC, bmiVC, homeVC, navKyoVC, medicineScanVC]
        
        // Set HomeVC as the initially selected tab
        tabBarController.selectedIndex = 2 

        // Animate transition to Tab Bar Controller
        UIView.transition(with: window!,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.window?.rootViewController = tabBarController },
                          completion: nil)
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
    }


}

