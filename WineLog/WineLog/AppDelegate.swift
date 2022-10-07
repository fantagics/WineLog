//
//  AppDelegate.swift
//  WineLog
//
//  Created by 이태형 on 2022/10/03.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
<<<<<<< HEAD
        let categoryVC = AddWineCategoryVC()
        let firstNavVC = UINavigationController(rootViewController: categoryVC)
        navigationBarConfiguration(firstNavVC)
        let wishListVC = MyWineListVC()
        let secondNavVC = UINavigationController(rootViewController: wishListVC)
        navigationBarConfiguration(secondNavVC)
        let tabBarController = UITabBarController()
        
//        firstNavVC.tabBarItem = UITabBarItem(title: "Domino/'s", image: UIImage(named: "domino's"), tag: 0)
        firstNavVC.tabBarItem.title = "First"
        firstNavVC.tabBarItem.image = UIImage(named: "wineGlass")
        firstNavVC.tabBarItem.imageInsets = UIEdgeInsets(top: 110, left: 100, bottom: 110, right: 100)
        secondNavVC.tabBarItem.title = "Second"
        secondNavVC.tabBarItem.image = UIImage(systemName: "list.bullet.circle.fill")
        
=======
        let firstNavVC = UINavigationController(rootViewController: AddWineCategoryVC())
        let secondNavVC = UINavigationController(rootViewController: MyWineListVC())
        let tabBarController = UITabBarController()
        
        firstNavVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "plus"), tag: 0)
        secondNavVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "list.bullet"), tag: 1)
>>>>>>> 995dd743c252ec13e9e2e7d84e70795000d6e74a
        tabBarController.viewControllers = [firstNavVC, secondNavVC]
        tabBarController.tabBar.tintColor = .myGreen
        tabBarController.tabBar.unselectedItemTintColor = .myGreen?.withAlphaComponent(0.3)
        
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func navigationBarConfiguration(_ controller: UINavigationController) {
        controller.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
        controller.navigationBar.tintColor = UIColor.darkGray
        controller.navigationBar.backgroundColor = .white
        let backbarButton = UIBarButtonItem(title: "fff", style: .plain, target: nil, action: nil)
        controller.navigationItem.backBarButtonItem = backbarButton
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.backgroundColor = UIColor.white
            navBarAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
            controller.navigationBar.standardAppearance = navBarAppearance
            controller.navigationBar.scrollEdgeAppearance = navBarAppearance
            controller.navigationBar.compactAppearance = navBarAppearance
            
            let backbarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            controller.navigationItem.backBarButtonItem = backbarButton
        }
    }
    
}
