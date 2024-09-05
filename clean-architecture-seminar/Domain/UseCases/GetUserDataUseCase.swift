//
//  GetUserDataUseCase.swift
//  clean-architecture-seminar
//
//  Created by 아우신얀 on 9/4/24.
//

import Foundation

protocol GetUserDataUseCase {
    
    /// 사용자 정보 가져오는 함수
    func getUserData(completion: @escaping (UserDataModel) -> Void)
}

// 더미데이터
final class DefaultGetUserDataUseCase: GetUserDataUseCase {
    
    func getUserData(completion: @escaping (UserDataModel) -> Void) {
            let dummyData = UserDataModel(
                id: 1,
                username: "yanni",
                name: "신얀",
                isGeneralSignUp: true,
                passwordUpdatedAt: "",
                profileImageUrl: "",
                phone: "",
                profileVisibility: "",
                locked: false,
                notifySetting: NotifySetting(accountBookNotify: true, feedNotify: true, chatNotify: true),
                createdAt: "",
                oauthAccount: OauthAccount(kakao: false, google: true, apple: false)
            )
    }
}
