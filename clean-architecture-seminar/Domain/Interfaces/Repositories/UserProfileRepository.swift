//
//  UserProfileRepositories.swift
//  clean-architecture-seminar
//
//  Created by 아우신얀 on 9/5/24.
//

import Foundation

protocol UserProfileRepository {
    func fetchUserProfile() -> UserDataModel
}

class DefaultUserProfileRepository: UserProfileRepository {
    func fetchUserProfile() -> UserDataModel {
        return UserDataModel(
            id: 1,
            username: "yanni",
            name: "신얀",
            isGeneralSignUp: false,
            passwordUpdatedAt: "2024-09-04 12:00:00",
            profileImageUrl: "https://example.com/profile.jpg",
            phone: "010-0000-0000",
            profileVisibility: "PRIVATE",
            locked: false,
            notifySetting: NotifySettingModel(accountBookNotify: true, feedNotify: true, chatNotify: true),
            createdAt: "2024-09-04 12:00:00",
            oauthAccount: OAuthAccountModel(kakao: true, google: false, apple: false))
    }
}
