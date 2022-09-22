//
//  PostModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 21/09/22.
//

import Foundation

struct PostModel: Identifiable, Codable {
    var id: String?
    let caption: String
    let timestamp: Date
    let likes: Int
    let imageUrl: String
    let ownerUid: String
    let ownerImageUrl: String
    let ownerUsername: String
    
    /// Just notifier rule
    var isLiked: Bool? = false
    var listLikes: [String]? = []
}
