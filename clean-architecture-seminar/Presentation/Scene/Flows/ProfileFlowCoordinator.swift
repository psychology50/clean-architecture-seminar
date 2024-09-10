//
//  ProfileFlowCoordinator.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/10/24.
//

import SwiftUI

protocol ProfileFlowCoordinatorDependency  {
    func makeProfileViewModel() -> DefaultUserProfileViewModel
}

final class ProfileFlowCoordinator {

    private let dependencies: ProfileFlowCoordinatorDependency
    private weak var profileViewModel: DefaultUserProfileViewModel?

    init(dependencies: ProfileFlowCoordinatorDependency) {
        self.dependencies = dependencies
    }
    
    func start() {
        let vm = dependencies.makeProfileViewModel()
//
//        navigationController?.pushViewController(vc, animated: false)
//        moviesListVC = vc
    }
}
