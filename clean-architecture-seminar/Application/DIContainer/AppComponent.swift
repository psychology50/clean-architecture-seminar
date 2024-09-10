//
//  AppComponent.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/11/24.
//

import SwiftUI

final class AppComponent{

    private let appDIContainer = AppDIContainer()
    
    // Lazy로 appFlowCoordinator를 선언하여 appDIContainer가 먼저 초기화된 후에 생성되도록 함
    private lazy var appFlowCoordinator: AppFlowCoordinator = {
        AppFlowCoordinator(appDIContainer: appDIContainer)
    }()
    
    func makeRootView() -> some View {
        let profileFactory = appFlowCoordinator.profileFlowStart()
        return rootComponent(profileFactory: profileFactory).makeView()
    }

    func rootComponent(profileFactory: any ProfileFactory) -> RootComponent {
        RootComponent(dependency: ProfileFactoryDependency(profileFactory: profileFactory))
    }
}

protocol RootDependency {
    var profileFactory: any ProfileFactory { get }
}

final class RootComponent {
    private let dependency: RootDependency
    
    init(dependency: RootDependency) {
        self.dependency = dependency
    }

    func makeView() -> some View {
        RootView(
            profileFactory: dependency.profileFactory
        )
    }
}
