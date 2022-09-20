//
//  UserModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import Foundation

struct UserModel: Identifiable, Decodable {
    let id = UUID()
    let email: String
    let username: String
    let fullname: String
    let profileImageURL: String
    let uid: String
}
