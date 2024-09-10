//
//  ProfileResponseDTO.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/10/24.
//

import Foundation

struct ProfileResponseDTO: Equatable {
    private let id: Int64
    private let username: String
    private let name: String
    private let isGeneralSignUp: Bool
    private let passwordUpdatedAt: String
    private let profileImageUrl: String
    private let phone: String
    private let profileVisibility: String
    private let locked: Bool
    private let notifySetting: NotifySettingDTO
    private let createdAt: String
    private let oauthAccount: OAuthAccountDTO
}

struct NotifySettingDTO: Equatable {
    private let accountBookNotify: Bool
    private let feedNotify: Bool
    private let chatNotify: Bool
}

struct OAuthAccountDTO: Equatable {
    private let kakao: Bool
    private let google: Bool
    private let apple: Bool
}

extension ProfileResponseDTO {
    func toModel() -> UserModel {
        return .init(id: id, username: username, name: name, isGeneralSignUp: isGeneralSignUp, passwordUpdatedAt: passwordUpdatedAt, profileImageUrl: profileImageUrl, phone: phone, profileVisibility: profileVisibility, locked: locked, notifySetting: NotifySettingDTO.toDomain(notifySetting)(), createdAt: createdAt, oauthAccount: OAuthAccountDTO.toDomain(oauthAccount)())
    }
}

extension NotifySettingDTO {
    func toDomain() -> NotifySettingModel {
        return .init(accountBookNotify: accountBookNotify, feedNotify: feedNotify, chatNotify: chatNotify)
    }
}

extension OAuthAccountDTO {
    func toDomain() -> OAuthAccountModel {
        return .init(kakao: kakao, google: google, apple: apple)
    }
}
