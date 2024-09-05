//
//  UserData.swift
//  clean-architecture-seminar
//
//  Created by 아우신얀 on 9/4/24.
//

import Foundation

struct UserDataModel: Equatable {
    let id: Int64
    var username: String //사용자 아이디
    var name: String //사용자 이름
    let isGeneralSignUp: Bool
    let passwordUpdatedAt: String
    var profileImageUrl: String
    var phone: String
    let profileVisibility: String
    let locked: Bool
    var notifySetting: NotifySettingModel
    let createdAt: String
    var oauthAccount: OAuthAccountModel
}

struct NotifySettingModel: Equatable {
    let accountBookNotify: Bool
    let feedNotify: Bool
    let chatNotify: Bool
}

struct OAuthAccountModel: Equatable {
    let kakao: Bool
    let google: Bool
    let apple: Bool
}
