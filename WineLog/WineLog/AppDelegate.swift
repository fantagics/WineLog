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
        
        let categoryVC = AddWineCategoryVC()
        let firstNavVC = UINavigationController(rootViewController: categoryVC)
        let wishListVC = MyWineListVC()
        let secondNavVC = UINavigationController(rootViewController: wishListVC)
        let tabBarController = UITabBarController()
        
//        firstNavVC.tabBarItem = UITabBarItem(title: "Domino/'s", image: UIImage(named: "domino's"), tag: 0)
        firstNavVC.tabBarItem.title = "First"
        firstNavVC.tabBarItem.image = UIImage(named: "wineGlass")
        firstNavVC.tabBarItem.imageInsets = UIEdgeInsets(top: 110, left: 100, bottom: 110, right: 100)
        secondNavVC.tabBarItem.title = "Second"
        secondNavVC.tabBarItem.image = UIImage(systemName: "list.bullet.circle.fill")
        
        tabBarController.viewControllers = [firstNavVC, secondNavVC]
        tabBarController.tabBar.tintColor = .red
        
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
