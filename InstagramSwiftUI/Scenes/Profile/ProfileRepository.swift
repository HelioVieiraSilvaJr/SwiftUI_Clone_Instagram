//
//  ProfileRepository.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 20/09/22.
//

import Foundation
import Firebase

struct ProfileRepository {
    
    func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = SessionManager.shared.uid else { return }
        Firestore.firestore().collection(COLLECTION_FOLLOWING)
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .setData([:]) { _ in
                
            Firestore.firestore().collection(COLLECTION_FOLLOWERS)
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .setData([:], completion: completion)
        }
    }
    
    func unFollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = SessionManager.shared.uid else { return }
        Firestore.firestore().collection(COLLECTION_FOLLOWING)
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .delete { _ in
                
            Firestore.firestore().collection(COLLECTION_FOLLOWERS)
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .delete(completion: completion)
        }
    }
    
    func isFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = SessionManager.shared.uid else { return }
        
        Firestore.firestore().collection(COLLECTION_FOLLOWING)
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .getDocument { snapshot, _ in
            
            let flag = snapshot?.exists ?? false
            completion(flag)
        }
    }
}
