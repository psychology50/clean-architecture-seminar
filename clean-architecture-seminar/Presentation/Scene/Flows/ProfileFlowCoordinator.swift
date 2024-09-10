//
//  ProfileFlowCoordinator.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/10/24.
//

import SwiftUI

struct ProfileFactoryDependency: RootDependency {
    let profileFactory: any ProfileFactory
}

protocol ProfileFactory {
    associatedtype SomeView: View
    func makeProfileView() -> SomeView
}

final class DefaultProfileFactory: ProfileFactory {
    private let userProfileViewModelWrapper: UserProfileViewModelWrapper
    
    init(userProfileViewModelWrapper: UserProfileViewModelWrapper) {
        self.userProfileViewModelWrapper = userProfileViewModelWrapper
    }
    
    public func makeProfileView() -> some View {
        UserProfileView(viewModelWrapper: userProfileViewModelWrapper)
    }
}

//
//protocol ProfileFlowCoordinatorDependency  {
//    func makeProfileViewModel() -> any UserProfileViewModel
//}
//
//final class ProfileFlowCoordinator {
//
//    private let dependencies: ProfileFlowCoordinatorDependency
//    private var profileViewModel: any UserProfileViewModel
//
//    init(dependencies: ProfileFlowCoordinatorDependency) {
//        self.dependencies = dependencies
//    }
//    
//    func start() {
//        let vm = dependencies.makeProfileViewModel()
//        profileViewModel = vm
//    }
//}
