//
//  AppDelegate.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/5/24.
//

import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()

        window?.rootViewController = navigationController
//        appFlowCoordinator = AppFlowCoordinator(
//            navigationController: navigationController,
//            appDIContainer: appDIContainer
//        )
//        appFlowCoordinator?.start()
//        window?.makeKeyAndVisible()
    
        return true
    }
}
