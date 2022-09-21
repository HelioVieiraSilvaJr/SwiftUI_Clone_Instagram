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
    
    func fetchPosts(uid: String, didSuccess: @escaping (([PostModel]) -> Void)) {
        Firestore.firestore().collection(COLLECTION_POSTS).whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, error in
            if let error = error {
                print("ERROR: Não foi possivel pegar coleção 'users' -> (\(error.localizedDescription).")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ JSONDecoder.decode(to: PostModel.self, from: $0.data()) })
            didSuccess(posts)
        }
    }
}
