//
//  AppDelegate.swift
//  Countries of world
//
//  Created by Mamatqobilov Bobomurod on 28/07/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let nav = UINavigationController(rootViewController: CountryList())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }


}

