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
    var userData: Observable<UserModel> {get}
}

protocol UserProfileViewModel: UserProfileViewModelInput, UserProfileViewModelOutput { }

class DefaultUserProfileViewModel: UserProfileViewModel {
    var userData: Observable<UserModel>
    
    private let fetchUserProfileUseCase: FetchUserProfileUseCase
    
    init(fetchUserProfileUseCase: FetchUserProfileUseCase) {
        self.fetchUserProfileUseCase = fetchUserProfileUseCase
        self.userData = Observable(UserModel(
            id: 0,
            username: "",
            name: "기본",
            isGeneralSignUp: false,
            passwordUpdatedAt: "",
            profileImageUrl: "",
            phone: "",
            profileVisibility: "",
            locked: false,
            notifySetting: NotifySettingModel(accountBookNotify: false, feedNotify: false, chatNotify: false),
            createdAt: "",
            oauthAccount: OAuthAccountModel(kakao: false, google: false, apple: false)
        ))
    }
    
    /// usecase를 호출하여 사용자 데이터를 업데이트하는 메서드
    private func updateUserData() {
        self.userData.value = fetchUserProfileUseCase.execute()
        Log.debug(self.userData.value)
    }
    
    /// 이름을 업데이트하는 메서드
    private func updateName(_ newName: String) {
        self.userData.value = self.userData.value.update(name: newName)
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
