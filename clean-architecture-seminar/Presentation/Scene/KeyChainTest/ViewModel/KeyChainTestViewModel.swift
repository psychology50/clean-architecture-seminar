//
//  KeyChainTestViewModel.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/4/24.
//

import Foundation

class KeyChainTestViewModel: ObservableObject {
    @Published var loadedAccessToken: String?
    
    private let keychainHelper = KeychainService()

    func saveToken(_ token: String) {
        keychainHelper.saveAccessToken(accessToken: token)
        print("AccessToken saved successfully.")
    }
    
    func loadToken() {
        if let token = keychainHelper.loadAccessToken() {
            loadedAccessToken = token
            print("Loaded AccessToken: \(token)")
        } else {
            print("Failed to load AccessToken.")
        }
    }
    
    func deleteToken() {
        keychainHelper.deleteAccessToken()
        print("AccessToken deleted successfully.")
    }
}
