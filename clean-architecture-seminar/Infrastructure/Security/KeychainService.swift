//
//  KeychainService.swift
//  clean-architecture-seminar
//
//  Created by 최희진 on 9/4/24.
//

import Foundation

class KeychainService {
    
    private let tag: String
    
    // 초기화 메서드에서 tag 값을 설정
    init(tag: String = "accessToken") {
        self.tag = tag
    }
    
    // MARK: AccessToken Keychain
    
    func saveAccessToken(accessToken: String) {
        let keychainQuery: [CFString: Any] = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: tag,
            kSecValueData: accessToken.data(using: .utf8)!
        ]
        
        let status = SecItemAdd(keychainQuery as CFDictionary, nil)
        if status == errSecDuplicateItem {
            SecItemUpdate(keychainQuery as CFDictionary, [kSecValueData: accessToken.data(using: .utf8)!] as CFDictionary)
        } else if status != noErr {
            print("Failed to save AccessToken to Keychain")
        }
    }
    
    func loadAccessToken() -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: tag,
            kSecReturnData: kCFBooleanTrue!
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == noErr, let data = item as? Data, let token = String(data: data, encoding: .utf8) {
            return token
        } else {
            return nil
        }
    }
    
    func deleteAccessToken() {
        let query: [CFString: Any] = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: tag,
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status != noErr {
            print("Failed to delete AccessToken from Keychain")
        }
    }
}
