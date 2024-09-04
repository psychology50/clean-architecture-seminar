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
    var userData: UserModel {get set}
}

protocol UserProfileViewModel: UserProfileViewModelInput, UserProfileViewModelOutput{ }

class DefaultUserProfileViewModel: UserProfileViewModel {
    var userData: UserModel
    
    private let fetchUserProfileUseCase: FetchUserProfileUseCase
    private let mainQueue: DispatchQueue
    
    init(fetchUserProfileUseCase: FetchUserProfileUseCase, mainQueue: DispatchQueue = .main) {
        self.fetchUserProfileUseCase = fetchUserProfileUseCase
        self.mainQueue = mainQueue
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
