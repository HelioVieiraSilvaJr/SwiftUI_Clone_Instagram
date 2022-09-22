//
//  CommentModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import Foundation

struct CommentModel: Identifiable, Codable {
    let id = UUID()
    let username: String
    let profileImageUrl: String
    let uid: String
    let timestamp: Date
    let postOwnerUid: String
    let comment: String
}
