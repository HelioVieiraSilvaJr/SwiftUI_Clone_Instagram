//
//  NotificationModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import Foundation

struct NotificationModel: Identifiable, Codable {
    let id = UUID()
    let timestamp: Date
    let username: String
    let uid: String
    let profileImageUrl: String
    let type: NotificationType
    let postId: String?
    
    enum NotificationType: String, Codable {
        case like, comment, follow
        
        var notificationMessage: String {
            switch self {
            case .like: return "Curtiu sua postagem."
            case .comment: return "Comentou na sua postagem."
            case .follow: return "Começou a seguir você."
            }
        }
    }
}
