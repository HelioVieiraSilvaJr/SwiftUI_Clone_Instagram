//
//  NotificationsManager.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import Foundation
import Firebase

class NotificationsManager: ObservableObject {
    
    // MARK: Properties
    static var shared = NotificationsManager()
    private var listenerNotifications: ListenerRegistration?
    @Published var notifications: [NotificationModel] = []
    
    // MARK: Initialization
    init() {
        fetchNotifications()
    }
    
    // MARK: Methods
    func sendNotification(toUid uid: String,
                          type: NotificationModel.NotificationType,
                          post: PostModel?) {
        
        guard let currentUser = SessionManager.shared.currentUser else { return }
        
        let data = NotificationModel(timestamp: Date(),
                                     username: currentUser.username,
                                     uid: currentUser.uid,
                                     profileImageUrl: currentUser.profileImageURL,
                                     type: type, postId: post?.id)
        
        Firestore.firestore().collection(COLLECTION_USERS)
            .document(uid)
            .collection(COLLECTION_USER_NOTIFICATIONS)
            .addDocument(data: data.toJSON(), completion: nil)
    }
    
    func fetchNotifications() {
        guard let uid = SessionManager.shared.uid else { return }
        let query = Firestore.firestore().collection(COLLECTION_USERS)
            .document(uid)
            .collection(COLLECTION_USER_NOTIFICATIONS)
            .order(by: "timestamp", descending: true)
        
        self.listenerNotifications = query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            let contentOf = addedDocs.compactMap({ JSONDecoder.decode(to: NotificationModel.self, from: $0.document.data()) })
            self.notifications.append(contentsOf: contentOf)
        }
        
        
    }
    
    func clear() {
        notifications = []
        listenerNotifications?.remove()
    }
}
