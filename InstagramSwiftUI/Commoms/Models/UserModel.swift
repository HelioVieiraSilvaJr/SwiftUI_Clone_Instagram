//
//  UserModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import Foundation

struct UserModel: Identifiable, Codable {
    let id = UUID()
    let email: String
    let username: String
    let fullname: String
    let profileImageURL: String
    let uid: String
    var bio: String?
    var stats: Stats?
    
    /// Just notifier rule
    var isFollowed: Bool? = false
    
    func isCurrentUser() -> Bool {
        uid == SessionManager.shared.uid
    }
    
    struct Stats: Codable {
        let followers: Int
        let followings: Int
        let posts: Int
    }
}
