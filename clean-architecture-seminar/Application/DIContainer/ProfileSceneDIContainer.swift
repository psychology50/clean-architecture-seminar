//
//  ProfileSceneDIContainer.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/10/24.
//

import SwiftUI

final class ProfileSceneDIContainer {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // DefaultProfileFactory를 생성하여 반환
    func makeProfileFactory() -> DefaultProfileFactory {
        let viewModelWrapper = makeUserProfileViewModelWrapper()
        return DefaultProfileFactory(userProfileViewModelWrapper: viewModelWrapper)
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
    func makeProfileViewModel() -> any UserProfileViewModel {
        DefaultUserProfileViewModel(fetchUserProfileUseCase: makeProfileUseCase())
    }
    
    // MARK: - View Model Wrapper
    
    func makeUserProfileViewModelWrapper() -> UserProfileViewModelWrapper {
        UserProfileViewModelWrapper(
            viewModel: makeProfileViewModel()
        )
    }
//    
//    // MARK: - Flow Coordinator
//    func createProfileFlow() -> ProfileFlowCoordinator {
//        ProfileFlowCoordinator(dependencies: self)
//    }
}
