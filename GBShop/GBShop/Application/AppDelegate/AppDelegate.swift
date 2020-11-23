//
//  AppDelegate.swift
//  GBShop
//
//  Created by Станислав Белых on 19.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let di = Di()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        di.testRequests()
        
        return true
    }
}

