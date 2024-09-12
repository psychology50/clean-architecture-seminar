//
//  RootComponent.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/12/24.
//

import SwiftUI

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
