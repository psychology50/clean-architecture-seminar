//
//  FetchUserProfileUseCase.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/4/24.
//

import Foundation

protocol FetchUserProfileUseCase {
    func execute() -> UserModel
}

class DefaultFetchUserProfileUseCase: FetchUserProfileUseCase {
    private let repository: UserProfileRepository
    
    init(repository: UserProfileRepository) {
        self.repository = repository
    }
    
    func execute() -> UserModel {
        return repository.fetchUserProfile()
    }
}
