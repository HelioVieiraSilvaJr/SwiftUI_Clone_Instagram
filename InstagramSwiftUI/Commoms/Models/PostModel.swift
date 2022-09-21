//
//  PostModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 21/09/22.
//

import Foundation

struct PostModel: Identifiable, Codable {
    let id = UUID()
    let caption: String
    let timestamp: Date?
    let likes: Int
    let imageUrl: String
    let ownerUid: String
    let ownerImageUrl: String
    let ownerUsername: String
}
