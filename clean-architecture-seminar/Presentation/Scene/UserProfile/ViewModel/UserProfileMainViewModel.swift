//
//  UserProfileMainViewModel.swift
//  clean-architecture-seminar
//
//  Created by 아우신얀 on 9/4/24.
//

import Foundation
import Combine

protocol UserProfileMainInput {
    func start()
}

protocol UserProfileMainOutput {
    var userProfileItem: UserProfileItemViewModel? { get }
}

protocol UserProfileMainViewModel: UserProfileMainInput, UserProfileMainOutput { }

final class DefaultUserProfileMainViewModel: ObservableObject, UserProfileMainViewModel {
    
    @Published var userProfileItem: UserProfileItemViewModel?

    private let getUserData: GetUserDataUseCase


    init(getUserData: GetUserDataUseCase) {
        self.getUserData = getUserData
    }
    
    func start() {
        getUserData.getUserData { [weak self] data in
            self?.userProfileItem = UserProfileItemViewModel(userData: data) // UserProfileItemViewModel로 초기화
        }
    }
}



