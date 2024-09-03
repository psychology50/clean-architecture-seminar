//
//  KeychainService.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/4/24.
//

import Foundation

class KeychainService {
    
    private static let tag: String = "accessToken"
    
    // MARK: AccessToken Keychain
    
    static func saveAccessToken(accessToken: String) {
        let keychainQuery: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: tag,
            kSecValueData: accessToken.data(using: .utf8)!,
        ]
        
        let status = SecItemAdd(keychainQuery as CFDictionary, nil)
        if status == errSecDuplicateItem {
            SecItemUpdate(keychainQuery as CFDictionary, [kSecValueData: accessToken.data(using: .utf8)!] as CFDictionary)
        } else if status != noErr {
            print("Failed to save AccessToken to Keychain")
        }
    }
    
    static func loadAccessToken() -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: tag,
            kSecReturnData: kCFBooleanTrue!,
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == noErr, let data = item as? Data, let token = String(data: data, encoding: .utf8) {
            return token
        } else {
            return nil
        }
    }
    
    static func deleteAccessToken() {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: tag,
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status != noErr {
            print("Failed to delete AccessToken from Keychain")
        }
    }
    
}
