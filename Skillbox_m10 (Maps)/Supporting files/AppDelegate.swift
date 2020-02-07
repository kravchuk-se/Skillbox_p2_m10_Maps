//
//  AppDelegate.swift
//  Skillbox_m10 (Maps)
//
//  Created by Kravchuk Sergey on 03.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import UIKit
import GoogleMaps
import YandexMapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Google
        GMSServices.provideAPIKey(APIKeys.Google)
        
        // Yandex
        YMKMapKit.setApiKey(APIKeys.Yandex)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

