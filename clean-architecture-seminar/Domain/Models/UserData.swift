//
//  UserData.swift
//  clean-architecture-seminar
//
//  Created by 아우신얀 on 9/4/24.
//

import Foundation

struct UserData: Equatable {
    let id: Int64
    var username: String //사용자 이름
    var name: String
    let isGeneralSignUp: Bool
    let passwordUpdatedAt: String
    var profileImageUrl: String
    var phone: String
    let profileVisibility: String
    let locked: Bool
    var notifySetting: NotifySetting
    let createdAt: String
    var oauthAccount: OauthAccount
}

struct NotifySetting: Equatable {
    let accountBookNotify: Bool
    let feedNotify: Bool
    let chatNotify: Bool
}

struct OauthAccount: Equatable {
    let kakao: Bool
    let google: Bool
    let apple: Bool
}
