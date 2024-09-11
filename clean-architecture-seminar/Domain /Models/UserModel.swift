//
//  UserModel.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/4/24.
//

import Foundation

struct UserModel: Equatable {
    let id: Int64
    let username: String
    let name: String
    let isGeneralSignUp: Bool
    let passwordUpdatedAt: String
    let profileImageUrl: String
    let phone: String
    let profileVisibility: String
    let locked: Bool
    let notifySetting: NotifySettingModel
    let createdAt: String
    let oauthAccount: OAuthAccountModel
    
    func update(
        id: Int64? = nil,
        username: String? = nil,
        name: String? = nil,
        isGeneralSignUp: Bool? = nil,
        passwordUpdatedAt: String? = nil,
        profileImageUrl: String? = nil,
        phone: String? = nil,
        profileVisibility: String? = nil,
        locked: Bool? = nil,
        notifySetting: NotifySettingModel? = nil,
        createdAt: String? = nil,
        oauthAccount: OAuthAccountModel? = nil
    ) -> UserModel {
        return UserModel(
            id: id ?? self.id,
            username: username ?? self.username,
            name: name ?? self.name,
            isGeneralSignUp: isGeneralSignUp ?? self.isGeneralSignUp,
            passwordUpdatedAt: passwordUpdatedAt ?? self.passwordUpdatedAt,
            profileImageUrl: profileImageUrl ?? self.profileImageUrl,
            phone: phone ?? self.phone,
            profileVisibility: profileVisibility ?? self.profileVisibility,
            locked: locked ?? self.locked,
            notifySetting: notifySetting ?? self.notifySetting,
            createdAt: createdAt ?? self.createdAt,
            oauthAccount: oauthAccount ?? self.oauthAccount
        )
    }
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
