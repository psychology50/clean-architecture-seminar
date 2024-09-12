//
//  UserProfileViewModel.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/5/24.
//

import Foundation

protocol UserProfileViewModelInput {
    func viewDidLoad()
    func updateData(_ newName: String)
}

protocol UserProfileViewModelOutput {
    var userData: Observable<UserProfileItemModel> {get}
}

protocol UserProfileViewModel: UserProfileViewModelInput, UserProfileViewModelOutput { }

class DefaultUserProfileViewModel: UserProfileViewModel {
    var userData: Observable<UserProfileItemModel>
    
    private let fetchUserProfileUseCase: FetchUserProfileUseCase
    
    init(fetchUserProfileUseCase: FetchUserProfileUseCase) {
        self.fetchUserProfileUseCase = fetchUserProfileUseCase
        self.userData = Observable(UserProfileItemModel(
            username: "",
            name: "기본"
        ))
    }
    
    /// usecase를 호출하여 사용자 데이터를 업데이트하는 메서드
    private func updateUserData() {
        self.userData.value.username = fetchUserProfileUseCase.execute().username
        self.userData.value.name = fetchUserProfileUseCase.execute().name
        
        Log.debug(self.userData.value)
    }
    
    /// 이름을 업데이트하는 메서드
    private func updateName(_ newName: String) {
        Log.debug("Updated name to \(newName)")
        Log.debug("Updated \(self.userData.value)")
    }
}


// MARK: - INPUT. View event methods
extension DefaultUserProfileViewModel {
        
    func viewDidLoad() {
        updateUserData()
    }
    
    func updateData(_ newName: String) {
        updateName(newName)
    }
    
}
