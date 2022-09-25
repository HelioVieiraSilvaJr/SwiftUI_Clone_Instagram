//
//  FeedRepository.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 21/09/22.
//

import Foundation
import Firebase

struct FeedRepository {
    
    func fetchPosts(completion: @escaping ([PostModel]) -> Void) {
        Firestore.firestore().collection(COLLECTION_POSTS).order(by: "timestamp", descending: true).getDocuments { snapshot, error in
            if let error = error {
                print("ERROR: Não foi possivel recuperar os Posts do usuário. (\(error.localizedDescription)")
                return
            }
            
            if let documents = snapshot?.documents {
                let posts: [PostModel] = documents.compactMap { document in
                    var post = JSONDecoder.decode(to: PostModel.self, from: document.data())
                    post?.id = document.documentID
                    return post
                }
                completion(posts)
            }
        }
    }
    
    func like(post: PostModel, completion: @escaping () -> Void) {
        guard let postId = post.id, let currentId = SessionManager.shared.uid else { return }
        Firestore.firestore().collection(COLLECTION_POSTS).document(postId).collection(COLLECTION_POST_LIKES).document(currentId).setData([:]) { _ in
            Firestore.firestore().collection(COLLECTION_USERS).document(currentId).collection(COLLECTION_USER_LIKES).document(postId).setData([:]) { _ in
                completion()
            }
        }
    }
    
    func unLike(post: PostModel, completion: @escaping () -> Void) {
        guard let postId = post.id, let currentId = SessionManager.shared.uid else { return }
        Firestore.firestore().collection(COLLECTION_POSTS).document(postId).collection(COLLECTION_POST_LIKES).document(currentId).delete() { _ in
            Firestore.firestore().collection(COLLECTION_USERS).document(currentId).collection(COLLECTION_USER_LIKES).document(postId).delete() { _ in
                completion()
            }
        }
    }
    
    func fetchListLikes(post: PostModel, completion: @escaping ([String]) -> Void) {
        guard let postId = post.id else { return }
        Firestore.firestore().collection(COLLECTION_POSTS).document(postId).collection(COLLECTION_POST_LIKES)
            .getDocuments { snapshot, _ in
            
                guard let listLikes: [String] = snapshot?.documents.compactMap({ $0.documentID }) else { return }
            completion(listLikes)
        }
    }
}
