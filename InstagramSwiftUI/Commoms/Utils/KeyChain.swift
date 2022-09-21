//
//  KeyChain.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 20/09/22.
//

import Foundation

struct KeyChain {
    
    @discardableResult
    static func save(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key,
            kSecValueData as String: data ] as [String: Any]

        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }

    static func load(key: String) -> Data? {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne ] as [String: Any]

        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        // swiftlint:disable force_cast
        if status == noErr {
            return dataTypeRef as! Data?
        } else {
            return nil
        }
    }
    
    static func remove(key: String) {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key] as [String: Any]

        SecItemDelete(query as CFDictionary)
    }
}