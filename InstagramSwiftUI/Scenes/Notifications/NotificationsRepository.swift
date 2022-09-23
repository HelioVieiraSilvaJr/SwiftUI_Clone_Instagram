//
//  NotificationsRepository.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import Foundation
import Firebase

struct NotificationsRepository {
    
    func isFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = SessionManager.shared.uid else { return }
        
        Firestore.firestore().collection(COLLECTION_USERS)
            .document(currentUid)
            .collection(COLLECTION_USER_FOLLOWINGS)
            .document(uid)
            .getDocument { snapshot, _ in
            
            let flag = snapshot?.exists ?? false
            completion(flag)
        }
    }
    
    func getPostImageUrl(postId: String, completion: @escaping (PostModel) -> Void) {
        Firestore.firestore().collection(COLLECTION_POSTS).document(postId).getDocument { snapshot, _ in
            
            guard let data = snapshot?.data(),
                  let post = JSONDecoder.decode(to: PostModel.self, from: data)
            else { return }
            
            completion(post)
        }
    }
    
    func getOwnerUser(uid: String, completion: @escaping (UserModel) -> Void) {
        Firestore.firestore().collection(COLLECTION_USERS).document(uid).getDocument { snapshot, _ in
            guard ((snapshot?.exists) != nil),
                  let data = snapshot?.data(),
                  let user = JSONDecoder.decode(to: UserModel.self, from: data) else { return }
            completion(user)
        }
    }
}
