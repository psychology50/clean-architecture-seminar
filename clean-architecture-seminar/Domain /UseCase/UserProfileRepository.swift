//
//  UserProfileRepository.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/4/24.
//

import Foundation

/// 사용자 프로필 데이터를 가져오는 동작을 정의하는 프로토콜
protocol UserProfileRepository {
    
    /// 사용자 프로필 데이터를 가져오는 함수
    /// - Returns: `UserModel` 타입의 사용자 프로필 데이터를 반환
    func fetchUserProfile() -> UserModel
}

class DefaultUserProfileRepository: UserProfileRepository {
    
    func fetchUserProfile() -> UserModel {
        return UserModel(
            id: 1,
            username: "user1",
            name: "홍길동",
            isGeneralSignUp: false,
            passwordUpdatedAt: "2023-09-04 12:00:00",
            profileImageUrl: "https://example.com/profile.jpg",
            phone: "010-1234-5678",
            profileVisibility: "PUBLIC",
            locked: false,
            notifySetting: NotifySettingModel(accountBookNotify: true, feedNotify: true, chatNotify: true),
            createdAt: "2023-09-04 12:00:00",
            oauthAccount: OAuthAccountModel(kakao: true, google: false, apple: false)
        )
    }
}

