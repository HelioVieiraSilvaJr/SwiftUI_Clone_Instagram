//
//  NotificationCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import Foundation
import SwiftUI

class NotificationCellViewModel: ObservableObject {
    
    let notification: NotificationModel
    private let repository = NotificationsRepository()
    @Published var isFollowed = false
    @Published var post: PostModel?
    @Published var user: UserModel?
    
    init(notification: NotificationModel) {
        self.notification = notification
        getNotificationPost()
        getNotificationUser()
    }
    
    func checkIfFollowed() {
        repository.isFollowed(uid: notification.uid) { isFollowed in
            self.isFollowed = isFollowed
        }
    }
    
    func getNotificationPost() {
        guard let postId = notification.postId else { return }
        repository.getPostImageUrl(postId: postId) { post in
            self.post = post
        }
    }
    
    func getNotificationUser() {
        repository.getOwnerUser(uid: notification.uid) { user in
            self.user = user
        }
    }
}
