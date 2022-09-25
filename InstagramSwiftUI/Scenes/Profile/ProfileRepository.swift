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
        Firestore.firestore().collection(COLLECTION_USERS)
            .document(currentUid)
            .collection(COLLECTION_USER_FOLLOWINGS)
            .document(uid)
            .setData([:]) { _ in
                
            Firestore.firestore().collection(COLLECTION_USERS)
                    .document(uid)
                    .collection(COLLECTION_USER_FOLLOWERS)
                    .document(currentUid)
                    .setData([:], completion: completion)
        }
    }
    
    func unFollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = SessionManager.shared.uid else { return }
        Firestore.firestore().collection(COLLECTION_USERS)
            .document(currentUid)
            .collection(COLLECTION_USER_FOLLOWINGS)
            .document(uid)
            .delete { _ in
                
            Firestore.firestore().collection(COLLECTION_USERS)
                    .document(uid)
                    .collection(COLLECTION_USER_FOLLOWERS)
                    .document(currentUid)
                    .delete(completion: completion)
        }
    }
    
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
    
    func updateUser(completion: @escaping (UserModel) -> Void) {
        guard let currenteUser = SessionManager.shared.currentUser else { return }
        Firestore.firestore().collection(COLLECTION_USERS).document(currenteUser.uid).getDocument { snapshot, _ in
            
            guard let data = snapshot?.data(),
                  let user = JSONDecoder.decode(to: UserModel.self, from: data) else { return }
            
            completion(user)
        }
    }
    
    func fetchStats(uid: String, completion: @escaping (UserModel.Stats) -> Void) {
        let query = Firestore.firestore().collection(COLLECTION_USERS).document(uid)
        
        Firestore.firestore().collection(COLLECTION_POSTS)
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                let posts = snapshot?.documents.count ?? 0
                
            query.collection(COLLECTION_USER_FOLLOWERS).getDocuments { snapshot, _ in
                    let followers = snapshot?.documents.count ?? 0
                    
                query.collection(COLLECTION_USER_FOLLOWINGS).getDocuments { snapshot, _ in
                        let followings = snapshot?.documents.count ?? 0
                        
                    let stats = UserModel.Stats(followers: followers, followings: followings, posts: posts)
                    completion(stats)
                }
            }
        }
    }
}
