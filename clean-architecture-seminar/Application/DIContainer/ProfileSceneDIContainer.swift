//
//  ProfileSceneDIContainer.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/10/24.
//

import SwiftUI

final class ProfileSceneDIContainer: ProfileFlowCoordinatorDependency {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
    private func makeProfileUseCase() -> FetchUserProfileUseCase {
        DefaultFetchUserProfileUseCase(repository: makeProfileRepository())
    }
    
    // MARK: - Repository
    private func makeProfileRepository() -> FetchUserProfileProtocol {
        DefaultUserProfileRepository()
    }
    
    // MARK: - View Model
    func makeProfileViewModel() -> DefaultUserProfileViewModel {
        DefaultUserProfileViewModel(fetchUserProfileUseCase: makeProfileUseCase())
    }
    
    // MARK: - Flow Coordinator
    func createProfileFlow() -> ProfileFlowCoordinator {
        ProfileFlowCoordinator(dependencies: self)
    }
}
