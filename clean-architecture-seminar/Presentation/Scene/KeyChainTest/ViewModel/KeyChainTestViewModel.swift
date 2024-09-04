//
//  KeyChainTestViewModel.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/4/24.
//

import Foundation

class KeyChainTestViewModel: ObservableObject {

    func saveToken(_ token: String) {
        KeychainUtil.saveAccessToken(accessToken: token)
        Log.info("AccessToken saved successfully.")
    }
    
    func loadToken() {
        if let token = KeychainUtil.loadAccessToken() {
            Log.info("Loaded AccessToken: \(token)")
        } else {
            Log.fault("Failed to load AccessToken.")
        }
    }
    
    func deleteToken() {
        KeychainUtil.deleteAccessToken()
        Log.info("AccessToken deleted successfully.")
    }
}
