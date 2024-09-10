//
//  UserProfileViewModel.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/5/24.
//

import Foundation
import SwiftUI

protocol UserProfileViewModelInput {
    func viewWillAppear()
}

protocol UserProfileViewModelOutput {
    var userData: UserModel {get}
}

//generic
//protocol UserProfileViewModel: UserProfileViewModelInput, UserProfileViewModelOutput, ObservableObject { }

//stateObject
protocol UserProfileViewModel: UserProfileViewModelInput, UserProfileViewModelOutput { }

class DefaultUserProfileViewModel: ObservableObject, UserProfileViewModel {
    @Published var userData: UserModel
    
    private let fetchUserProfileUseCase: FetchUserProfileUseCase
    
    init(fetchUserProfileUseCase: FetchUserProfileUseCase) {
        self.fetchUserProfileUseCase = fetchUserProfileUseCase
        self.userData = UserModel(
            id: 0,
            username: "",
            name: "",
            isGeneralSignUp: false,
            passwordUpdatedAt: "",
            profileImageUrl: "",
            phone: "",
            profileVisibility: "",
            locked: false,
            notifySetting: NotifySettingModel(accountBookNotify: false, feedNotify: false, chatNotify: false),
            createdAt: "",
            oauthAccount: OAuthAccountModel(kakao: false, google: false, apple: false)
        )
    }
    
    /// usecase를 호출하여 사용자 데이터를 업데이트하는 메서드
    private func updateUserData() {
       self.userData =  fetchUserProfileUseCase.execute()
 
    }
}


// MARK: - INPUT. View event methods
extension DefaultUserProfileViewModel {
        
    func viewWillAppear() {
        updateUserData()
    }
}
